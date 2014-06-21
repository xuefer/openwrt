#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=ifenslave
PKG_VERSION:=1.1.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-2.0

PKG_SOURCE:=$(PKG_NAME)-2.6_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/i/ifenslave-2.6/
PKG_MD5SUM:=56126cd1013cefe0ce6f81613e677bdd

include $(INCLUDE_DIR)/package.mk

define Package/ifenslave
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+kmod-bonding
  TITLE:=A utility to manipulate kernel ethernet bonding devices
  VERSION:=$(LINUX_VERSION)-$(PKG_RELEASE)
  URL:=http://www.kernel.org
endef

define Package/ifenslave/description
 ifenslave is needed to add/remove interfaces to/from ethernet bond devices.
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/ifenslave \
		$(PKG_BUILD_DIR)/ifenslave.c
endef

define Package/ifenslave/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ifenslave $(1)/sbin/
endef

$(eval $(call BuildPackage,ifenslave))
