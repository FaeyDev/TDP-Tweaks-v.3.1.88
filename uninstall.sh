#!/system/bin/bash

# our module's directory
MODDIR=${0%/*}

# loop over the files in the backup dir
for i in $MODDIR/backup/*; do

    # execute them
    /system/bin/bash $i;

done
