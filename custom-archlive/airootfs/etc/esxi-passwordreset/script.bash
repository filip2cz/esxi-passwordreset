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

mkdir /mnt/working
mount /dev/$DISK /mnt/working

mkdir /root/state
tar -xf /mnt/working/state.tgz -C /root/state

mkdir /root/localtgz
crypto-util envelope extract --aad ESXConfiguration /root/local/local.tgz.ve /root/localtgz/local.tgz

mkdir /root/local
tar -xf /root/localtgz/local.tgz.ve -C /root/local