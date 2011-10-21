PACKAGE = Python
VERSION = 2.7.2

LOCATION = http://python.org/ftp/python/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

include packages/build-tools/autotools.mk

conf-args += \
	--enable-shared

edit = sed 's/@MAJOR@/$(MAJOR)/g;s/@MINOR@/$(MINOR)/g' $(pkgsrctree)/python.in

$(pkgtree)/.generate-wrapper:
	rm $(prefix)/bin/python && \
		$(call edit) > $(prefix)/bin/python && \
		chmod 0755 $(prefix)/bin/python
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.generate-wrapper
