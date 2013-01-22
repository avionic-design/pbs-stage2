PACKAGE = procps
VERSION = 3.2.8
LICENSE = GPL LGPL

LOCATION = http://procps.sourceforge.net
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	lib64=lib \
	ldconfig=@:

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/free \
	$(prefix)/bin/pgrep \
	$(prefix)/bin/pkill \
	$(prefix)/bin/pmap \
	$(prefix)/bin/ps \
	$(prefix)/bin/pwdx \
	$(prefix)/bin/skill \
	$(prefix)/bin/slabtop \
	$(prefix)/bin/snice \
	$(prefix)/bin/tload \
	$(prefix)/bin/top \
	$(prefix)/bin/uptime \
	$(prefix)/bin/vmstat \
	$(prefix)/bin/w \
	$(prefix)/bin/watch \
	$(prefix)/lib/libproc-$(VERSION).so \
	$(prefix)/sbin/sysctl

include packages/cleanup.mk
include packages/binary.mk
