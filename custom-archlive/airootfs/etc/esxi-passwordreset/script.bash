#!/bin/bash

echo "Welcome in ESXi Password Reset iso"
echo

fdisk -l
echo

REPEAT=true

while [ $REPEAT == true ]
do
    echo -n "Select disk with ESXi image (sdxN) [sda5]:"
    read DISK

    if [ -z "$DISK" ]; then
        DISK="sda5"
    fi
    if [ ! -b "/dev/$DISK" ]; then
        echo "invalid partition: $DISK"
    else
        REPEAT=false
    fi
done

