PACKAGE = Linux-PAM
VERSION = 1.3.0
LICENSE = GPL

LOCATION = http://www.linux-pam.org/library
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--sbindir=$(prefix)/sbin \
	--libdir=$(prefix)/lib \
	--disable-regenerate-docu \
	--disable-rpath \
	--disable-nls

prunefiles = \
	$(prefix)/lib/security/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/sbin/mkhomedir_helper \
	$(prefix)/sbin/pam_tally \
	$(prefix)/sbin/pam_tally2 \
	$(prefix)/sbin/pam_timestamp_check \
	$(prefix)/sbin/unix_chkpwd \
	$(prefix)/sbin/unix_update \
	$(prefix)/lib/security/pam_filter/upperLOWER \
	$(prefix)/lib/security/*.so \
	$(prefix)/lib/*.so.*
