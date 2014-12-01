PACKAGE = libdaemon
VERSION = 0.14
MD5=509dc27107c21bcd9fbf2f95f5669563

LOCATION = http://pkgs.fedoraproject.org/repo/pkgs/$(PACKAGE)/$(PACKAGE)-$(VERSION).tar.gz/$(MD5)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	ac_cv_func_setpgrp_void=no

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
