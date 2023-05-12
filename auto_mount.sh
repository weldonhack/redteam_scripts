#!/bin/bash

#This script will automatically mount a device whenever it is inserted to a computer running Parrot OS.

#Get the device name of the inserted device.
device_name=$(lsblk | awk '$1 == "sd" && $7 == "1" {print $2}')

#Check if the device is already mounted.
if mountpoint -q "$device_name"; then
echo "The device is already mounted."
exit 0
fi

#Mount the device.
sudo mount "$device_name" /media/usb

#Show a message to the user.
echo "The device has been mounted successfully."
