# 
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/target.mk

PKG_NAME:=ccache
PKG_VERSION:=3.1.9

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://samba.org/ftp/ccache/
PKG_MD5SUM:=522a6016bda56892653612bbdefff3e0

include $(INCLUDE_DIR)/host-build.mk

HOST_LDFLAGS += $(HOST_STATIC_LINKING)
HOST_CONFIGURE_VARS += CC="$(HOSTCC_NOCACHE)"

define Host/Install/ccache
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin/
	$(CP) ./files/* $(STAGING_DIR_HOST)/bin/
endef

ifneq ($(strip $(shell which ccache >/dev/null && echo found)),found)
  define Host/Install/Impl
	$(MAKE) -C $(HOST_BUILD_DIR) install
	$(call Host/Install/Default)
  endef

  define Host/Clean/Impl
	-$(MAKE) -C $(HOST_BUILD_DIR) uninstall
	$(call Host/Clean/Default)
  endef
  define Host/Install
	$(call Host/Install/Default)
	$(call Host/Install/ccache)
  endef
else
  define Host/Prepare
  endef
  define Host/Configure
  endef
  define Host/Compile
  endef
  define Host/Install/Impl
	$(call Host/Install/ccache)
  endef
  define Host/Clean/Impl
  endef
  define Download
  endef
endif

define Host/Install
  $(call Host/Install/Impl)
	@mkdir -p $(STAGING_DIR)/ccache/bin/
	@CCACHE=`which ccache`; for name in c++ cc g++ gcc $(TARGET_CXX) $(TARGET_CC); do \
	  $(LN) "$$$$CCACHE" $(STAGING_DIR)/ccache/bin/$$$$name; \
	done
endef
define Host/Clean
  $(call Host/Clean/Impl)
	@rm -rf $(STAGING_DIR)/ccache/bin/
endef

$(eval $(call HostBuild))
