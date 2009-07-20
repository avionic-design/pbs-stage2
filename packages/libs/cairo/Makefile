PACKAGE = cairo
VERSION = 1.8.8

LOCATION = http://cairographics.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

sover = 2.10800.8

prunefiles = \
	$(prefix)/lib/libcairo.la

stripfiles = \
	$(prefix)/lib/libcairo.so.$(sover)
