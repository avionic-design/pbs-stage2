PACKAGE = readline
VERSION = 6.2

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-curses

build-args += \
	SHLIB_LIBS="-lncurses"

prunefiles =
stripfiles = \
	$(prefix)/lib/libhistory.so.$(VERSION) \
	$(prefix)/lib/libreadline.so.$(VERSION)
