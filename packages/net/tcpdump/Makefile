PACKAGE = tcpdump
VERSION = 4.3.0
LICENSE = BSD

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

ACLOCAL_FLAGS += -I $(pkgbuildtree)/m4

$(pkgtree)/.aclocal-force:
	cd $(pkgbuildtree) && \
		$(env) aclocal --force --install $(ACLOCAL_FLAGS)
	$(call cmd,stamp)

$(pkgtree)/.autoreconfigure: $(pkgtree)/.aclocal-force

conf-args += \
	--without-crypto \
	--enable-ipv6 \
	--disable-smb

conf-vars += \
	td_cv_buggygetaddrinfo=no \
	ac_cv_linux_vers=2

prunefiles = \
	$(prefix)/sbin/tcpdump.$(VERSION)

stripfiles = \
	$(prefix)/sbin/tcpdump
