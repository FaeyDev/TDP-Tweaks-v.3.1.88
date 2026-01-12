#!/system/bin/sh

# Android 12.1 or newer
if [[ "$(/system/bin/getprop ro.build.version.sdk)" -lt 31 ]]; then
    ui_print ""
    ui_print "This cannot be used on anything older than Android 12L."
    ui_print ""

fi

ui_print "---------------------------------------------"
ui_print " Copying and Creating some Goodies..."

# get our architecture
ARCHI=$(/system/bin/getprop ro.product.cpu.abi);
if [ "${ARCHI}" != "$(printf '%s' "${ARCHI}" | sed 's/'"arm64"'//g')" ]; then

    # copy in our 64b binaries
    cp $MODPATH/binaries/dp-arm64 $MODPATH/system/bin/dp;

else

    # copy in the 32b binaries
    cp $MODPATH/binaries/dp-arm32 $MODPATH/system/bin/dp;

fi;

# we can remove the entire binaries folder now
rm -rf $MODPATH/binaries;

# screw it... make the backup dir
mkdir -p $MODPATH/backup;

ui_print "---------------------------------------------"
ui_print " Setting some permissions..."
sleep 3
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/post-fs-data.sh 0 0 0755
set_perm $MODPATH/uninstall.sh 0 0 0755
set_perm $MODPATH/system/bin/logd 0 0 0755
set_perm $MODPATH/system/bin/dp 0 0 0755
set_perm $MODPATH/tdp.db 0 0 0644
set_perm_recursive $MODPATH/backup 0 0 0755
chcon u:r:magisk:s0 $MODPATH/service.sh
chcon u:r:magisk:s0 $MODPATH/post-fs-data.sh
chcon u:r:magisk:s0 $MODPATH/uninstall.sh
chcon u:r:magisk:s0 $MODPATH/tdp.db
chcon u:r:magisk:s0 $MODPATH/system/bin/dp

ui_print "---------------------------------------------"
ui_print "---------------------------------------------"
ui_print " IMPORTANT!"
ui_print "---------------------------------------------"
ui_print "---------------------------------------------"
ui_print " After you reboot, do not run 'dp'"
ui_print " until you get the notification that the"
ui_print " backups are done being built."
ui_print ""
ui_print " This may take some time"
ui_print " Have Patience, it will finish... eventually"
ui_print ""
ui_print " It is necessary in order to build the "
ui_print " backup scripts, per your device's"
ui_print " original settings and configuration."
ui_print "---------------------------------------------"
ui_print "---------------------------------------------"
ui_print " YOU HAVE BEEN WARNED!"
ui_print "---------------------------------------------"
ui_print "---------------------------------------------"
sleep 5

ui_print "---------------------------------------------"
ui_print "---------------------------------------------"
ui_print " All Set!"
ui_print " Please Reboot Now"
ui_print "---------------------------------------------"
ui_print "---------------------------------------------"
sleep 2
