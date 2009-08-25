PACKAGE = minicom
VERSION = 2.3

LOCATION = https://alioth.debian.org/frs/download.php/2332
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

DESCRIPTION = friendly menu-driven serial communication program

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/ascii-xfr \
	$(prefix)/bin/minicom \
	$(prefix)/bin/runscript
