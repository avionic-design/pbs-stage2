PACKAGE = ruby
VERSION = 2.2.3
LICENSE = BSD

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.ruby-lang.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/autotools.mk

conf-args += \
	--disable-install-doc \
	--with-out-ext=tk \
	--with-openssl-lib=$(prefix)/lib64
