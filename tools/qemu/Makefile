#
# Copyright (C) 2010-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=qemu
PKG_VERSION:=2.8.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://wiki.qemu-project.org/download/$(PKG_SOURCE)
PKG_HASH:=dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62

include $(INCLUDE_DIR)/host-build.mk

HOST_CFLAGS += \
	-I$(STAGING_DIR_HOST)/include/e2fsprogs \
	-DAES_cbc_encrypt=QEMU_AES_cbc_encrypt \
	-DAES_decrypt=QEMU_AES_decrypt \
	-DAES_encrypt=QEMU_AES_encrypt \
	-DAES_set_decrypt_key=QEMU_AES_set_decrypt_key \
	-DAES_set_encrypt_key=QEMU_AES_set_encrypt_key

HOST_CONFIGURE_VARS := \
	CFLAGS="$(HOST_CFLAGS)" \
	LDFLAGS="$(HOST_LDFLAGS)"

HOST_CONFIGURE_ARGS := \
	--extra-cflags="$(HOST_CFLAGS)" \
	--enable-uuid

define Host/Configure
	(cd $(HOST_BUILD_DIR); \
		PKG_CONFIG=/usr/bin/pkg-config \
		PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/share/pkgconfig \
		PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig \
		CFLAGS="$(HOST_CFLAGS)" \
		LDFLAGS="$(HOST_LDFLAGS)" \
		$(HOST_CONFIGURE_CMD) \
		--extra-cflags="$(HOST_CFLAGS)" \
		--enable-uuid \
	)
endef

define Host/Compile
	$(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR) qemu-img
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/qemu-img $(STAGING_DIR_HOST)/bin
endef

$(eval $(call HostBuild))
