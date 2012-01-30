PACKAGE = rsyslog
VERSION = 6.2.0

LOCATION = http://www.rsyslog.com/files/download/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=$(prefix)/lib/systemd/system
endif

conf-vars-$(CONFIG_GLIBC) += ac_cv_func_malloc_0_nonnull=yes
conf-vars-$(CONFIG_GLIBC) += ac_cv_func_realloc_0_nonnull=yes

conf-vars += $(conf-vars-y)

prunefiles = \
	$(prefix)/lib/rsyslog/*.la

stripfiles = \
	$(prefix)/lib/rsyslog/*.so \
	$(prefix)/sbin/rsyslogd
