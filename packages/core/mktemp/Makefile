PACKAGE = mktemp
VERSION = 1.5

LOCATION = ftp://ftp.mktemp.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = makes unique filenames for temporary files

##############################################################################

include packages/autotools.mk

conf-vars += \
	sudo_cv_ebcdic=no

package-post-install:
	$(priv) $(STRIP) $(ROOTFS)$(prefix)/bin/mktemp

package-clean:
	@:

