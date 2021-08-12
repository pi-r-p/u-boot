cp -f ../arm-trusted-firmware/build/sun50i_a64/release/bl31.bin ./bl31.bin

export BL31=bl31.bin
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export SCP=/dev/null

if [ ! -e ".config" ]; then
	echo "make default pine64-lts_defconfig"
	make pine64-lts_defconfig
fi
echo "start build"
make all -j$(nproc)

if [ -e "/dev/sda" ]; then
  echo "copy to /dev/sda"
  dd if=u-boot-sunxi-with-spl.bin of=/dev/sda bs=8k seek=1
fi
sync

