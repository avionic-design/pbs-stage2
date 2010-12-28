PACKAGE = openssh
VERSION = 5.6p1

LOCATION = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

# uClibc 0.9.31 doesn't have utmpx, but git (as of 2010/09/09) has
conf-args-$(CONFIG_UCLIBC) = \
	--disable-utmpx

conf-args += \
	--libexecdir=$(prefix)/lib/openssh \
	--with-privsep-path=/var/run/sshd \
	--sysconfdir=/etc/ssh \
	--disable-strip \
	$(conf-args-y)

stripfiles = \
	$(prefix)/bin/scp \
	$(prefix)/bin/sftp \
	$(prefix)/bin/ssh \
	$(prefix)/bin/ssh-add \
	$(prefix)/bin/ssh-agent \
	$(prefix)/bin/ssh-keygen \
	$(prefix)/bin/ssh-keyscan \
	$(prefix)/lib/openssh/sftp-server \
	$(prefix)/lib/openssh/ssh-keysign \
	$(prefix)/lib/openssh/ssh-pkcs11-helper \
	$(prefix)/sbin/sshd
