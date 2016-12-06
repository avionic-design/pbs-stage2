include packages/libs/libxml2/Makefile.location
include packages/autotools.mk

conf-args += \
	--without-python

config-scriptfiles = \
	$(prefix)/bin/xml2-config

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/xmlcatalog \
	$(prefix)/bin/xmllint \
	$(prefix)/lib/*.so.*
