PACKAGE = belle-sip
VERSION = 1.4.2
LICENSE = GPL2

LOCATION = http://download.savannah.gnu.org/releases/linphone/$(PACKAGE)/
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

# Predefine antlr3 path as the target arch C runtime also depends on the
# --with-antlr configure option. Since obscure paths are used to detect antlr3
# in case the option is supplied and belle-sip depends on a specific version,
# parsing simply explodes if the host happens to have installed antlr3 as well.
conf-vars += \
	ac_cv_path_ANTLR=$(BUILD_TOOLS)/bin/antlr3

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
