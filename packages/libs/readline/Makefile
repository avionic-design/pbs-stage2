PACKAGE = readline
VERSION = 6.0

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles =
stripfiles = \
	$(prefix)/lib/libhistory.so.6.0 \
	$(prefix)/lib/libreadline.so.6.0
