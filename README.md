# Uboot for PINE64
Slightly modified from mainline:
- disable usb, network. keep only SD card.
- enable storage of environnment in ext4 (/boot/uboot.env)
- enable automatic reset if the uboot shell is not used
- Added binaries for bl31.bin
- no SCP support (because system won't sleep anyway)

Added a custom MakeAndDeploy.sh, to help compilation and debug (beware in /dev/sda is your main disk)

To edit uboot environment settings from user space, use `fw_printenv`, and customize `/etc/fw_env.config` with:
```
# Device to access      offset           env size
/boot/uboot.env 0x0000          0x20000
```

Added binaries for bl31.bin 

