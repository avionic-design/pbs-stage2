PACKAGE = nftables
VERSION = 0.7
LICENSE = GPLv2

LOCATION = http://ftp.netfilter.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

# We really don't want docs here. The regular docbook2man command
# present on most hosts is detected but breaks, since docbook2X with
# slightly different behaviour is expected. Kill it off until we have
# that package.
conf-args += \
	ac_cv_prog_CONFIG_PDF=no \
	DBLATEX=no \
	DOCBOOK2X_MAN=no \
	DOCBOOK2MAN=no \
	DB2X_DOCBOOK2MAN=no

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
