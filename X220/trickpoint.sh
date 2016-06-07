#!/bin/sh
temp="Section \"InputClass\"\n
Identifier \"Trackpoint Wheel Emulation\"\n
MatchProduct \"TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad / TrackPoint|ThinkPad USB Keyboard with TrackPoint|USB Trackpoint pointing device|Composite TouchPad / TrackPoint\"\n
MatchDevicePath \"/dev/input/event*\"\n
Option \"EmulateWheel\" \"true\"\n
Option \"EmulateWheelButton\" \"2\"\n
Option \"EmulateWheelInertia\" \"10\"\n
Option \"EmulateWheelTimeout\" \"190\"\n
Option \"Emulate3Buttons\" \"false\"\n
Option \"XAxisMapping\" \"6 7\"\n
Option \"YAxisMapping\" \"4 5\"\n
EndSection"
echo -e $temp >/etc/X11/xorg.conf.d/20-trackpoint.conf 
