PACKAGE = Linux-PAM
VERSION = 1.1.2

LOCATION = http://www.kernel.org/pub/linux/libs/pam/library
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libdir=/lib \
	--disable-regenerate-docu \
	--disable-rpath

prunefiles = \
	/lib/security/*.la \
	/lib/*.la

stripfiles = \
	/sbin/mkhomedir_helper \
	/sbin/pam_tally \
	/sbin/pam_tally2 \
	/sbin/pam_timestamp_check \
	/sbin/unix_chkpwd \
	/sbin/unix_update \
	/lib/security/pam_filter/upperLOWER \
	/lib/security/*.so \
	/lib/*.so.*
