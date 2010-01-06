PACKAGE = minicom
VERSION = 2.4

LOCATION = https://alioth.debian.org/frs/download.php/3195
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

DESCRIPTION = friendly menu-driven serial communication program

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/ascii-xfr \
	$(prefix)/bin/minicom \
	$(prefix)/bin/runscript
