#!/usr/bin/bash

MODDIR="/lib/modules/$(uname -r)/kernel"
drvWIFI="$MODDIR/drivers/net/wireless"
rtl="$drvWIFI/realtek/rtlwifi"
rtl8192su="$rtl/rtl8192su"

KMOD_SRC="./rtlwifi"

mkdir -p $rtl8192su
bak=".bak.`date +%Y%m%d-%H%M%S`"

install -v --suffix=$bak $KMOD_SRC/rtlwifi.ko			$rtl
install -v --suffix=$bak $KMOD_SRC/rtl_usb.ko			$rtl
install -v --suffix=$bak $KMOD_SRC/rtl8192s/rtl8192s-common.ko	$rtl8192su
install -v --suffix=$bak $KMOD_SRC/rtl8192su/rtl8192su.ko	$rtl8192su
