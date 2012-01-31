PACKAGE = poppler
VERSION = 0.18.3

LOCATION = http://poppler.freedesktop.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--disable-gtk-test \
	--disable-libcurl

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/pdffonts \
	$(prefix)/bin/pdfimages \
	$(prefix)/bin/pdfinfo \
	$(prefix)/bin/pdfseparate \
	$(prefix)/bin/pdftocairo \
	$(prefix)/bin/pdftohtml \
	$(prefix)/bin/pdftoppm \
	$(prefix)/bin/pdftops \
	$(prefix)/bin/pdftotext \
	$(prefix)/bin/pdfunite \
	$(prefix)/bin/poppler-glib-demo \
	$(prefix)/lib/*.so.*
