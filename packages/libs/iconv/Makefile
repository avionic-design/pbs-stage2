PACKAGE = libiconv
VERSION = 1.13.1
LICENSE = GPL

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

##############################################################################

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libcharset.la \
	$(prefix)/lib/libiconv.la

stripfiles = \
	$(prefix)/bin/iconv \
	$(prefix)/lib/libcharset.so.1.0.0 \
	$(prefix)/lib/libiconv.so.2.4.0 \
	$(prefix)/lib/preloadable_libiconv.so
