PACKAGE = ppl
VERSION = 1.0
LICENSE = GPL

LOCATION = http://bugseng.com/products/$(PACKAGE)/download/ftp/releases/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/toolchain/autotools.mk

conf-args += \
	--enable-interfaces='c,c++' \
	--with-gmp=$(prefix)
