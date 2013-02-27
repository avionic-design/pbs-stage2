PACKAGE = bcg729
VERSION = 1.0.0
LICENSE = GPLv2

LOCATION = http://download-mirror.savannah.gnu.org/releases/linphone/plugins/sources
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/mediastreamer/plugins/libmsbcg729.la

stripfiles = \
	$(prefix)/lib/libbcg729.so.0.0.0 \
	$(prefix)/lib/mediastreamer/plugins/libmsbcg729.so.0.0.0
