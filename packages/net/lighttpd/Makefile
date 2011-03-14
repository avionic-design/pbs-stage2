PACKAGE = lighttpd
VERSION = 1.4.28

MAJOR   = $(word 1,$(subst ., ,$(VERSION)))
MINOR   = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://download.lighttpd.net/$(PACKAGE)/releases-$(MAJOR).$(MINOR).x
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-bzip2 \

env += \
	PCRECONFIG=$(pkgtree)/build-pcre-config \

quiet_cmd_gen_pcre_config = GEN     $@
      cmd_gen_pcre_config = (echo \\\#!/bin/sh ; echo echo -lpcre) > $@ && chmod +x $@ || rm -f $@

$(pkgtree)/build-pcre-config:
	$(call cmd,gen_pcre_config)

$(pkgtree)/.configure: $(pkgtree)/build-pcre-config
