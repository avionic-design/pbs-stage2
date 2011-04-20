PACKAGE = rsyslog
VERSION = 5.8.0

LOCATION = http://www.rsyslog.com/files/download/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

conf-vars-$(CONFIG_GLIBC) += ac_cv_func_malloc_0_nonnull=yes
conf-vars-$(CONFIG_GLIBC) += ac_cv_func_realloc_0_nonnull=yes

conf-vars += $(conf-vars-y)

plugin = $(prefix)/lib/rsyslog

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/sbin/rsyslogd
