#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=x86_64
BOARD:=x86_64
BOARDNAME:=x86_64
FEATURES:=squashfs ext4 vdi vmdk pcmcia targz
MAINTAINER:=Imre Kaloz <kaloz@openwrt.org>

KERNEL_PATCHVER:=3.14

KERNELNAME:=bzImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += kmod-e1000 kmod-r8169

$(eval $(call BuildTarget))

$(eval $(call $(if $(CONFIG_TARGET_ROOTFS_ISO),RequireCommand,Ignore),mkisofs, \
   	Please install mkisofs. \
))
