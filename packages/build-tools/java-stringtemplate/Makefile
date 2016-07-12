PACKAGE = java-stringtemplate
VERSION = 3.2.1-2
LICENSE = BSD

JAVALIB = $(word 2,$(subst -, ,$(PACKAGE)))
LIBVER = $(word 1,$(subst -, ,$(VERSION)))

LOCATION = http://http.debian.net/debian/pool/main/s/$(JAVALIB)/
TARBALLS = lib$(JAVALIB)-java_$(VERSION)_all.deb
# NOTE: we deliberately use the binary package as compiling Java is a bit of
# effort and, considering it is all-arch anyway, just a waste of time.

include packages/build-tools/common.mk

# prefix within the .deb package, usually /usr
build-prefix = /usr

install-files = \
	share/java/$(JAVALIB)-$(LIBVER).jar

$(pkgtree)/.do-install: $(pkgtree)/.extract
	cd $(prefix) && \
		for file in $(install-files) ; do \
			mkdir -p $$(dirname $${file}) ; \
			cp $(pkgbuildtree)$(build-prefix)/$${file} $${file} ; \
		done
	ln -sf $(prefix)/share/java/$(JAVALIB)-$(LIBVER).jar \
		$(prefix)/share/java/$(JAVALIB).jar
	$(call cmd,stamp)
