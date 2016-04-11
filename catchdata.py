#!/usr/bin/env python
# -*- coding: utf-8 -*-
import time
import serial
import csv

ser = serial.Serial(
  port='/dev/ttyUSB0',
  baudrate=9600,
  parity=serial.PARITY_ODD,
  stopbits=serial.STOPBITS_TWO,
  bytesize=serial.SEVENBITS)

ser.write('a')
out=''
time.sleep(1)
while ser.inWaiting() > 0:
  out += ser.read(1)
ser.close()

data = out.split(':')
if(len(data)==11):
  print "read data successfully!"
  print data
else:
  print "error in transport"
  exit()

newdata=[]
newdata.append(time.strftime('%Y/%m/%d %H:%M:%S',time.localtime(time.time())))
newdata.append(float(data[1]))
newdata.append(float(data[2]))
newdata.append(float(data[4]))
newdata.append(float(data[6]))
newdata.append(float(data[7]))
newdata.append(float(data[9]))

csvfile = file('/home/shuai/media/lin_w/pyworkspace/storeData/weatherdata1.csv','a')
writer = csv.writer(csvfile)
writer.writerow(newdata)
csvfile.close()
print "finish writing file"

