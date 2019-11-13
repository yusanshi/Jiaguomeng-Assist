#!/bin/sh
# see: https://stackoverflow.com/questions/2604727/how-can-i-connect-to-android-with-adb-over-tcp
setprop service.adb.tcp.port -1
stop adbd
start adbd
echo "Successfully disable ADB over TCP and restore to USB."