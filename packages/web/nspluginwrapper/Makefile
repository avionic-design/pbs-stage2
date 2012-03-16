PACKAGE = nspluginwrapper
VERSION = 1.4.4

LOCATION = http://nspluginwrapper.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

pkglibdir = $(prefix)/lib/$(PACKAGE)

conf-args = \
	--prefix=$(prefix) \
	--target-cpu=i386 \
	--disable-biarch \
	--with-cc='$(CC)' \
	--with-cxx='$(CXX)' \
	--pkglibdir=$(pkglibdir) \
	--viewer-paths=$(pkglibdir)

conf-vars = \
	host_os=linux \
	host_cpu=i386 \
	CFLAGS='$(CFLAGS)' \
	CXXFLAGS='$(CXXFLAGS)' \
	LDFLAGS='$(LDFLAGS) -ldl'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && $(env) $(conf-vars) ./configure $(conf-args)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

systemdsystemunitdir=$(DESTDIR)/etc/systemd/system

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install
	$(INSTALL) -m 755 -d $(systemdsystemunitdir) && \
		$(INSTALL) -m 644 $(pkgsrctree)/$(PACKAGE).service $(systemdsystemunitdir)
	$(INSTALL) -m 755 -d $(systemdsystemunitdir)/graphical.target.wants && \
		ln -s ../$(PACKAGE).service $(systemdsystemunitdir)/graphical.target.wants
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk

stripfiles = \
	$(prefix)/lib/$(PACKAGE)/npconfig \
	$(prefix)/lib/$(PACKAGE)/npplayer \
	$(prefix)/lib/$(PACKAGE)/*.so \
