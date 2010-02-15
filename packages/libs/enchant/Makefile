PACKAGE = enchant
VERSION = 1.5.0

LOCATION = http://www.abisource.com/downloads/enchant/1.5.0
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

plugin = $(prefix)/lib/enchant

prunefiles = \
	$(prefix)/lib/libenchant.la \
	$(plugin)/libenchant_ispell.a \
	$(plugin)/libenchant_ispell.la \
	$(plugin)/libenchant_myspell.a \
	$(plugin)/libenchant_myspell.la \
	$(plugin)/libenchant_zemberek.a \
	$(plugin)/libenchant_zemberek.la

stripfiles = \
	$(prefix)/bin/enchant \
	$(prefix)/bin/enchant-lsmod \
	$(prefix)/lib/libenchant.so.1.5.0 \
	$(plugin)/libenchant_ispell.so \
	$(plugin)/libenchant_myspell.so \
	$(plugin)/libenchant_zemberek.so
