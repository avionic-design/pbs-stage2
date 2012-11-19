PACKAGE = libnl
VERSION = 3.2.21
LICENSE = LGPL

LOCATION = http://www.infradead.org/~tgr/$(PACKAGE)/files
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

plugin = $(prefix)/lib/$(PACKAGE)

prunefiles = \
	$(plugin)/cli/cls/*.la \
	$(plugin)/cli/cls/*.a \
	$(plugin)/cli/qdisc/*.la \
	$(plugin)/cli/qdisc/*.a \
	$(prefix)/lib/*.la

stripfiles = \
	$(plugin)/cli/cls/*.so \
	$(plugin)/cli/qdisc/*.so \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/genl-ctrl-list \
	$(prefix)/sbin/nl-class-add \
	$(prefix)/sbin/nl-class-delete \
	$(prefix)/sbin/nl-classid-lookup \
	$(prefix)/sbin/nl-class-list \
	$(prefix)/sbin/nl-cls-add \
	$(prefix)/sbin/nl-cls-delete \
	$(prefix)/sbin/nl-cls-list \
	$(prefix)/sbin/nl-link-list \
	$(prefix)/sbin/nl-pktloc-lookup \
	$(prefix)/sbin/nl-qdisc-add \
	$(prefix)/sbin/nl-qdisc-delete \
	$(prefix)/sbin/nl-qdisc-list
