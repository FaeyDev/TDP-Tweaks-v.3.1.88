#!/system/bin/bash

# our module's directory
MODDIR=${0%/*}

# we're going to wait until the boot has completed
while [ "$(/system/bin/getprop sys.boot_completed)" != 1 ]
do
    sleep 1
done

(

    # ------------------------------------------------------------------
    # - Build The Backup
    # ------------------------------------------------------------------
    (

        # no matter what we're going to run this. It will pop a notice when it's done, or it will simply do nothing
        dp backup;

        # throw a notice once we're here
        su -lp 2000 -c "cmd notification post -S bigtext -t 'Kevp75 TDP Tweaks' 'Tag' 'The backup has finished building.  Feel free to enable the tweaks as you see fit. =)'";

    ) & 
    # ------------------------------------------------------------------
    # - Start Tweaks
    # ------------------------------------------------------------------
    (
        # fire up an infinite loop
        while true
        do

            # since the tweaks all check if they're enabled or not, run them all
            dp run_all;

            # make it sleep for 8 hours
            sleep 8h

        done
    ) &

    # ------------------------------------------------------------------
    # - End Tweaks
    # ------------------------------------------------------------------


    # ------------------------------------------------------------------
    # - Start Blockers
    # ------------------------------------------------------------------



    # ------------------------------------------------------------------
    # - End Blockers
    # ------------------------------------------------------------------

    # ------------------------------------------------------------------
    # - Start Blockers
    # ------------------------------------------------------------------



    # ------------------------------------------------------------------
    # - End Blockers
    # ------------------------------------------------------------------

) &
