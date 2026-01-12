# TDP Tweaks by kevp75
## Details
* **Version:** 3.1.88
* **Platform API:** 32+
* **Android Version:** 12L+
* **Magisk Version:** 24.2+
* **Source Code:** https://gitlab.com/kp-development/android/tdp-tweaks.git 

This is a Magisk module that attempts to modify some settings and tweak some services for better device performance, better battery management, and better privacy.

It modifies some system settings, and then attempts to disable analytics services, ad services, diagnostic services, tracking services, wakelocks, and run-in-background packages.  Due to the nature of these services, some of them will run every 4 hours based on the time you last rebooted your device.

**NOTE:**  I cannot be held responsible for bricks, world takeovers, or nuclear warfare.  As such, installing this mod is completely on you.  If you do not want this, do not flash it.

## Requirements
* **Platform API:** 32+
* **Android Version:** 12L+
* **Magisk Version:** 24.2+

## Install

1. Download the zip file, and open Magisk.
    * You can find it here: https://gitlab.com/kp-development/android/tdp-tweaks/-/releases/
2. Tap on Modules
3. Tap 'Install from storage' and browse to where you downloaded the zip file to.
4. Tap 'Ok'
5. Reboot
6. Sit back and enjoy your device

## How To Use

We will generate backup scripts for the tweaks, and popup a shell notification that they have completed.  If you do not get this within an hour, open a shell: either an app or `adb shell` is fine.  Type in `su`, and then `dp backup`.  Then wait to get the notification.

You cannot run any of the tweaks without the backups being generated.  Once they have you can proceed.

Open a shell: either use an app for it, or you can use `adb shell`.  Type in `su`, and then type in `dp`.

## Description

W.I.P.

## Requesting Support

First things first, I do this for myself and no-one else, and have simply decided to share it.  I don't owe you anything, so if you demand anything from me, you will either be ignored, or reported, or both.

Thus said, I cannot help without logs, so make sure that when you ask for help that you have at the very least a Magisk log, which you can find in the management app.  Also helpful would be a logcat, please google how to get this, as I will not hold anyones hand.

You can either file an issue in my repo, or reply to the thread on XDA.

## Bootlooping

This is actually pretty easy to recover from. If it happens to you, please follow these steps to recover... also note, this does not just go for my module, but any module that you may end up bootlooping with.

1. Hold your power button until you power off.
2. Once your device is off, press the power button and when the boot animation starts, press and hold your volume down, and keep holding it until it boots.
3. Once  you are in Safe Mode (you will know as your homescreen will show it), simply reboot your device.  Magisk detects safe mode and disables all modules.

Please note, and this is very important: **YMMV**

This process may be different for your device, but there is this great thing called the internet, and that can help you.  Here: https://www.google.com/search?q=how+do+I+boot+my+android+phone+into+safe+mode 

## Donations
Always welcomed, never required.

If you do decide to donate, please accept my thanks as I lift the beer(s) you bought to toast you :)

Donations can be processed here: https://paypal.me/kevinpirnie

## Tested On
* OnePlus 11
    * Android 13 & 14
* Moto G Pure
    * Android 12.1
* Google Pixel 6 Pro
    * Android 13 & 14
* Ubuntu 22.04
    * i386 and x64 Processors
* WSL 2 - Ubuntu 22.04
    * i386 and x64 Processors

## Release Notes

### v. 3.1.88
* **Update:** Compiler
* **Add:** Compile for i386 and x64 platforms.
    * They're in the zip. If you want to use them, copy your platforms binary out of the zip to a folder somewhere on your machine, make sure it's executable and run it.  It will prompt you for the rest.
* **Remove:** Tweak multithreading
* **Remove:** Some OOM and LM Killers
    * Possibly fixing camera issues
* **Updated:** When the tweaks and backups fire.
* **Fixed:** Backup notice on fresh install

### v. 3.1.03
* **Update:** Massive Performance Update
    * rewrote all tweak processing and backup processing
* **Add:** Separate restore process
* **Add:** CLI Arguments for the tweaks and all restores
    * Also added arguments for the individual tweaks and restores as well

### v. 3.0.27
* **Update:** Memory Tweaks
* **Update:** Mount/IO Tweaks
* **Update:** How the tweaks are processed
* **Add:** Dozing exclusions
    * add packages or remove them from /data/adb/modules/kevp75-tdp-tweaks/excludes/dozing
    * there is a "stock" list of packages in there, for the most part, you will want to keep them there...
        * the 8 or 9 on the bottom are safe to remove... those are apps i have on my device ;)
* **Update:** Dozing aggression... it is a bit more aggressive now, but should be safe. YMMV
* **Add:** Disable/Enable Everything
* **Add:** Background Process Tweaks

### v. 3.0.1
* **Rewrite:** Complete rewrite in c++
    * Is now smaller, faster, and overall better
    * Compiled for: arm 32b & 64b
        * installer will detect and install the correct version on ARM devices
    * Backup generation is now required.
        * While it should run on first boot, there is no guarantee that it will.  The app will detect this, and will yell at you if they are not, and you haven't generated them.  You will not be able to run any tweaks unless they are run... so... have a little patience, you should be notified when they have finished running.
* **Temp. Remove:** Blockers
* **Temp. Remove:** System Tweaks
* **Add:** A little goodie for me and my monkey ;)
* **Add:** A couple more dozing properties
* **Add:** A few more memory properties
* **Add:** A couple more mount properties
* **Add:** Platform detection
