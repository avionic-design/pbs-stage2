PACKAGE = libeXosip2
VERSION = 3.3.0

LOCATION = http://www.very-clever.com/download/nongnu/exosip
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libeXosip2.la

stripfiles = \
	$(prefix)/bin/sip_reg \
	$(prefix)/lib/libeXosip2.so.4.2.0
