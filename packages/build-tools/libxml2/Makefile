include packages/libs/libxml2/Makefile.location
include packages/build-tools/autotools-reconf.mk
include packages/build-tools/xml.mk

prunefiles = \
	$(prefix)/lib/libxml2.la

# Create the catalog file if it doesn't exists yet
$(catalog):
	mkdir -p $(catalogdir) && $(XMLCATALOG) --create $(catalog)

$(pkgtree)/.binary: $(catalog)
