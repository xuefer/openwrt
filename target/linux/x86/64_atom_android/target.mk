ARCH:=x86_64
BOARDNAME:=Atom 64 for Android
DEFAULT_PACKAGES += kmod-e1000e kmod-e1000 kmod-r8169
DEFAULT_PACKAGES += kmod-drm kmod-squashfs
ARCH_PACKAGES:=x86_64
MAINTAINER:=Xuefer <xuefer@gmail.com>

define Target/Description
        Build images for Atom 64 bit systems to chroot android
endef
