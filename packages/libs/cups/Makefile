PACKAGE = cups
VERSION = 1.4.4

LOCATION = ftp://ftp.cups.org/pub/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION)-source.tar.bz2

include packages/common.mk

HOST_GNU_TYPE = $(shell $(srctree)/support/config.sub $(TARGET))
BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc \
	--disable-gssapi \
	--disable-ssl \
	--enable-debug

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	DSOFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DSTROOT=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

plugin = $(prefix)/lib/cups

stripfiles = \
	$(prefix)/bin/cancel \
	$(prefix)/bin/cupstestdsc \
	$(prefix)/bin/cupstestppd \
	$(prefix)/bin/lp \
	$(prefix)/bin/lpoptions \
	$(prefix)/bin/lppasswd \
	$(prefix)/bin/lpq \
	$(prefix)/bin/lpr \
	$(prefix)/bin/lprm \
	$(prefix)/bin/lpstat \
	$(prefix)/bin/ppdc \
	$(prefix)/bin/ppdhtml \
	$(prefix)/bin/ppdi \
	$(prefix)/bin/ppdmerge \
	$(prefix)/bin/ppdpo \
	$(plugin)/backend/ipp \
	$(plugin)/backend/lpd \
	$(plugin)/backend/parallel \
	$(plugin)/backend/scsi \
	$(plugin)/backend/serial \
	$(plugin)/backend/snmp \
	$(plugin)/backend/socket \
	$(plugin)/backend/usb \
	$(plugin)/cgi-bin/admin.cgi \
	$(plugin)/cgi-bin/classes.cgi \
	$(plugin)/cgi-bin/help.cgi \
	$(plugin)/cgi-bin/jobs.cgi \
	$(plugin)/cgi-bin/printers.cgi \
	$(plugin)/daemon/cups-deviced \
	$(plugin)/daemon/cups-driverd \
	$(plugin)/daemon/cups-lpd \
	$(plugin)/daemon/cups-polld \
	$(plugin)/filter/bannertops \
	$(plugin)/filter/commandtoescpx \
	$(plugin)/filter/commandtopclx \
	$(plugin)/filter/commandtops \
	$(plugin)/filter/gziptoany \
	$(plugin)/filter/hpgltops \
	$(plugin)/filter/imagetops \
	$(plugin)/filter/imagetoraster \
	$(plugin)/filter/pdftops \
	$(plugin)/filter/pstops \
	$(plugin)/filter/rastertoepson \
	$(plugin)/filter/rastertoescpx \
	$(plugin)/filter/rastertohp \
	$(plugin)/filter/rastertolabel \
	$(plugin)/filter/rastertopclx \
	$(plugin)/filter/texttops \
	$(plugin)/monitor/bcp \
	$(plugin)/monitor/tbcp \
	$(plugin)/notifier/dbus \
	$(plugin)/notifier/mailto \
	$(plugin)/notifier/rss \
	$(prefix)/lib/libcupscgi.so.1 \
	$(prefix)/lib/libcupsdriver.so.1 \
	$(prefix)/lib/libcupsimage.so.2 \
	$(prefix)/lib/libcupsmime.so.1 \
	$(prefix)/lib/libcupsppdc.so.1 \
	$(prefix)/lib/libcups.so.2 \
	$(prefix)/sbin/cupsaccept \
	$(prefix)/sbin/cupsaddsmb \
	$(prefix)/sbin/cupsctl \
	$(prefix)/sbin/cupsd \
	$(prefix)/sbin/cupsfilter \
	$(prefix)/sbin/lpadmin \
	$(prefix)/sbin/lpc \
	$(prefix)/sbin/lpinfo \
	$(prefix)/sbin/lpmove

include packages/cleanup.mk
include packages/binary.mk
