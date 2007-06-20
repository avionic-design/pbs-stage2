# base packages
packages-y += \
	core/base \
	kernel/linux-headers \
	devel/uclibc \
	core/busybox \
	core/coreutils \
	core/diffutils \
	core/grep \
	core/sed \
	core/sysvinit \
	core/udev \
	libs/sysfsutils \
	libs/zlib \
	libs/ncurses

# procps seems broken as well
#	core/procps

packages-y += \
	core/psmisc \
	core/util-linux \
	kernel/module-init-tools \
	shells/bash

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
	core/alsa-lib \
	core/alsa-utils

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
packages-$(ABOX)   += util/abox

# debugging helper packages
packages-$(DEBUG) += \
	devel/strace \
	net/iperf \
	net/netcat \
	libs/libpcap \
	net/tcpdump

