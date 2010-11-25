PACKAGE = openssh
VERSION = 5.6p1

LOCATION = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/openssh \
	--with-privsep-path=/var/run/sshd \
	--sysconfdir=/etc/ssh \
	--disable-strip
