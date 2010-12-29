PACKAGE = libdaemon
VERSION = 0.14

LOCATION = http://0pointer.de/lennart/projects/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	ac_cv_func_setpgrp_void=no

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
