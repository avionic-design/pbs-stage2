PACKAGE = startup-notification
VERSION = 0.10

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	lf_cv_sane_realloc=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
