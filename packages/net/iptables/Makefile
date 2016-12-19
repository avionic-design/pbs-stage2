PACKAGE = iptables
VERSION = 1.6.0
LICENSE = GPL

LOCATION = http://ftp.netfilter.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-nftables

plugin = $(prefix)/lib/xtables

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so \
	$(prefix)/sbin/xtables-multi
