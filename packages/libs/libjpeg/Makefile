PACKAGE = jpeg
VERSION = 6b

LOCATION = ftp://ftp.uu.net/graphics/jpeg
TARBALLS = $(PACKAGE)src.v$(VERSION).tar.gz

##############################################################################

include packages/autotools.mk

conf-vars += \
	$(call set-args, CC CFLAGS LD)

install-vars += \
	prefix=$(ROOTFS)$(prefix) \
	mandir=$(ROOTFS)$(prefix)/share/man/man1

package-clean:
	@:

