#!/bin/sh
sudo apt-get update;sudo apt-get install dnsmasq hostapd -y
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo cp hostapd.conf /etc/hostapd/hostapd.conf
sudo cp sysctl.conf /etc/sysctl.conf
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo cp interfaces /etc/network/interfaces
sudo cp rc.local /etc/rc.local
sudo reboot
