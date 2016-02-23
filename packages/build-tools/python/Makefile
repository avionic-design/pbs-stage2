PACKAGE = Python
VERSION = 2.7.8

LOCATION = http://python.org/ftp/python/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

include packages/build-tools/autotools.mk

conf-args += \
	--enable-shared \
	--with-system-expat \
	--with-system-ffi

edit = sed 's/@MAJOR@/$(MAJOR)/g;s/@MINOR@/$(MINOR)/g' $(pkgsrctree)/python.in

$(pkgtree)/.generate-wrapper:
	rm $(prefix)/bin/python && \
		$(call edit) > $(prefix)/bin/python && \
		chmod 0755 $(prefix)/bin/python
	rm $(prefix)/bin/python$(MAJOR) && \
		ln -s python $(prefix)/bin/python$(MAJOR)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.generate-wrapper

prunefiles = \
	$(prefix)/lib/python$(MAJOR).$(MINOR)/site-packages/libxml2mod.la \
	$(prefix)/lib/python$(MAJOR).$(MINOR)/site-packages/libxsltmod.la
