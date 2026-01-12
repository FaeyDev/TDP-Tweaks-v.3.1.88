#!/system/bin/bash

# our module's directory
MODDIR=${0%/*}

# we're going to wait until the boot has completed
while [ "$(/system/bin/getprop sys.boot_completed)" != 1 ]
do
    sleep 1
done
