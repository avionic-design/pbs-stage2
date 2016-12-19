PACKAGE = iptables
VERSION = 1.6.0
LICENSE = GPL

LOCATION = http://ftp.netfilter.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

ifeq ($(CONFIG_PACKAGE_NET_IPTABLES_NFTABLES_COMPAT),y)
conf-args += --enable-nftables
else
conf-args += --disable-nftables
endif

plugin = $(prefix)/lib/xtables

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so \
	$(prefix)/sbin/xtables-multi
