PACKAGE = ppp.git
VERSION = 2.4.5-git

PPP_SRC ?= ../ppp.git
export PPP_SRC

DESCRIPTION = PPP daemon

##############################################################################

include packages/common.mk

package-extract:
	mkdir -p $(pkgtree) && \
		cp -a $(PPP_SRC)/* $(pkgtree)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars =

package-configure:
#	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	cd $(pkgtree) && $(env) ./configure $(conf-args) $(conf-vars)

build-args = \
	CC='$(CC) $(CPPFLAGS) $(CFLAGS)'

package-build:
#	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	INSTROOT=$(ROOTFS) \
	DESTDIR=$(ROOTFS)$(prefix)

package-do-install:
#	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	cd $(pkgtree) && $(priv) $(env) install -m 755 \
		scripts/pon scripts/plog scripts/poff \
		$(ROOTFS)$(prefix)/bin
	$(priv) mkdir -p $(ROOTFS)/etc/ppp
	$(priv) install -m 755 \
		$(pkgsrctree)/ip-up $(pkgsrctree)/ip-down \
		$(ROOTFS)/etc/ppp

plugin = $(prefix)/lib/pppd/$(VERSION)

prunefiles =
stripfiles = \
	$(plugin)/minconn.so \
	$(plugin)/passprompt.so \
	$(plugin)/passwordfd.so \
	$(plugin)/radattr.so \
	$(plugin)/radius.so \
	$(plugin)/radrealms.so \
	$(plugin)/winbind.so \
	$(prefix)/sbin/chat \
	$(prefix)/sbin/pppd \
	$(prefix)/sbin/pppdump \
	$(prefix)/sbin/pppoe-discovery \
	$(prefix)/sbin/pppstats

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

