PACKAGE = libosip2
VERSION = 3.3.0

LOCATION = http://ftp.gnu.org/gnu/osip
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

sover = 4.2.0

prunefiles = \
	$(prefix)/lib/libosip2.la \
	$(prefix)/lib/libosipparser2.la

stripfiles = \
	$(prefix)/lib/libosip2.so.$(sover) \
	$(prefix)/lib/libosipparser2.so.$(sover)
