PACKAGE = valgrind
VERSION = 3.11.0

LOCATION = http://valgrind.org/downloads
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--enable-silent-rules

stripfiles = \
	$(prefix)/bin/cg_merge \
	$(prefix)/bin/valgrind \
	$(prefix)/bin/valgrind-listener \
	$(prefix)/bin/vgdb \
	$(prefix)/lib/valgrind/*.so \
	$(prefix)/lib/valgrind/*-$(ARCH)-$(OS)
