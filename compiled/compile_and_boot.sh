#!/bin/sh
set -x
cp ../arch/arm/boot/zImage-dtb .
../mkboot/mkbootfs ramdisk-15 | gzip > ramdisk-15_.gz
#../mkboot/mkbootimg --kernel zImage-dtb --ramdisk ramdisk-15_.gz --cmdline "androidboot.hardware=sturgeon user_debug=31 maxcpus=4 msm_rtb.filter=0x3F pm_levels.sleep_disabled=1 console=null androidboot.console=null buildvariant=user" --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x02000000 -o boot-15.img
../mkboot/mkbootimg --kernel zImage-dtb --ramdisk ramdisk-15_.gz --cmdline "androidboot.hardware=sturgeon user_debug=31 maxcpus=4 msm_rtb.filter=0x3F pm_levels.sleep_disabled=1 console=null androidboot.console=null enforcing=0 androidboot.selinux=permissive buildvariant=user" --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x02000000 -o boot-15.img
adb reboot bootloader
fastboot boot boot-15.img
