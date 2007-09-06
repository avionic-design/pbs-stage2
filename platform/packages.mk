packages-y += core/base

# check whether we want a git checkout of the Linux kernel or an officially
# released tarball
ifeq ($(LINUX_VERSION),git)
  packages-y += kernel/linux.git
else
  packages-y += kernel/linux
endif

ifeq ($(LIBC),uclibc)
  packages-y += devel/uclibc
endif

ifeq ($(LIBC),gnu)
  packages-y += devel/glibc
endif

# base packages
packages-y += \
	core/start-stop-daemon \
	core/coreutils \
	core/diffutils \
	core/grep \
	core/sed \
	core/sysvinit \
	core/udev \
	libs/sysfsutils \
	libs/zlib \
	libs/ncurses \
	core/procps \
	core/psmisc \
	core/util-linux \
	kernel/module-init-tools \
	shells/bash \
	core/less \
	disk/mtd-tools

packages-$(GREP) += \
	libs/pcre \
	core/grep

# network-related packages
packages-$(NET) += \
	net/net-tools \
	net/iputils

# USB support packages
packages-$(USB) += \
	libs/libusb \
	core/usbutils

# sound support packages
packages-$(SOUND) += \
	sound/alsa-lib \
	sound/alsa-utils

packages-$(SYSLOG) += core/sysklogd
packages-$(NTP)    += net/openntpd
packages-$(DHCP)   += net/udhcp
packages-$(PPP)    += net/ppp

# SSH packages
packages-$(SSH) += \
	libs/openssl \
	net/openssh

packages-$(SERIAL) += console/minicom
packages-$(FB)     += console/fbset

# image support
packages-$(PNG)  += libs/libpng
packages-$(JPEG) += libs/libjpeg

# X.Org Windowing System packages
packages-$(XORG) += \
	xorg/proto/bigreqs \
	xorg/proto/composite \
	xorg/proto/damage \
	xorg/proto/evie \
	xorg/proto/fixes \
	xorg/proto/fonts \
	xorg/proto/gl \
	xorg/proto/input \
	xorg/proto/kb \
	xorg/proto/randr \
	xorg/proto/record \
	xorg/proto/render \
	xorg/proto/resource \
	xorg/proto/scrnsaver \
	xorg/proto/trap \
	xorg/proto/video \
	xorg/proto/x \
	xorg/proto/xcb-proto \
	xorg/proto/xcmisc \
	xorg/proto/xext \
	xorg/proto/xf86bigfont \
	xorg/proto/xf86dga \
	xorg/proto/xf86dri \
	xorg/proto/xf86misc \
	xorg/proto/xf86vidmode \
	xorg/proto/xinerama

packages-$(XORG) += \
	xorg/lib/xau \
	xorg/lib/pthread-stubs \
	xorg/lib/xcb \
	xorg/lib/xtrans \
	xorg/lib/x11 \
	xorg/lib/xt

packages-$(XORG) += \
	xorg/xorg-server

# Qtopia
packages-$(QTOPIA) += \
	libs/qtopia

# DirectFB
packages-$(DIRECTFB) += \
	libs/directfb

# Gtk+
packages-$(GTK) += \
	libs/libiconv \
	libs/gettext \
	libs/glib \
	libs/atk \
	libs/pango \
	libs/cairo \
	libs/gtk+

# C++ bindings for Gtk+
packages-$(GTKMM) += \
	libs/libsigc++ \
	libs/glibmm \
	libs/gtkmm

# debugging helper packages
packages-$(DEBUG) += \
	devel/strace \
	net/iperf \
	net/netcat \
	libs/libpcap \
	net/tcpdump

packages-$(ABOX) += util/abox

