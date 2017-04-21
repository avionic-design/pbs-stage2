PACKAGE = cifs-utils
VERSION = 6.7

LOCATION = https://download.samba.org/pub/linux-cifs/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

ifeq ($(VERSION),6.7)
# cifs-utils 6.7 misses a couple generated files
include packages/autotools-reconf.mk
else
include packages/autotools.mk
endif

stripfiles = \
	/sbin/mount.cifs
