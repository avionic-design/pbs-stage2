PACKAGE = sudo
VERSION = 1.8.0

LOCATION = http://www.sudo.ws/$(PACKAGE)/dist
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	--without-lecture \
	--without-sendmail \
	--without-interfaces \
	--without-pam \
	--with-timedir=/var/run/sudo

build-args += \
	SYSROOT=$(SYSROOT)

stripfiles = \
	$(prefix)/bin/sudoreplay \
	$(prefix)/bin/sudoedit \
	$(prefix)/bin/sudo \
	$(prefix)/libexec/sudoers.so \
	$(prefix)/libexec/sudo_noexec.so \
	$(prefix)/sbin/visudo \
