PACKAGE = java-libantlr
VERSION = 2.7.7+dfsg-7
LICENSE = BSD

LOCATION = http://http.debian.net/debian/pool/main/a/antlr/
TARBALLS = libantlr-java_$(VERSION)_all.deb
# NOTE: we deliberately use the binary package as compiling Java is a bit of
# effort and, considering it is all-arch anyway, just a waste of time.

include packages/build-tools/common.mk

# prefix within the .deb package, usually /usr
build-prefix = /usr

install-files = \
	share/java/antlr.jar

$(pkgtree)/.do-install: $(pkgtree)/.extract
	cd $(prefix) && \
		for file in $(install-files) ; do \
			mkdir -p $$(dirname $${file}) ; \
			cp $(pkgbuildtree)$(build-prefix)/$${file} $${file} ; \
		done
	$(call cmd,stamp)
