PACKAGE = icewm
VERSION = 1.3.6

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-xinerama \
	--disable-i18n

conf-vars += \
	CXXFLAGS='$(CFLAGS)'

stripfiles = \
	$(prefix)/bin/icehelp \
	$(prefix)/bin/icesh \
	$(prefix)/bin/icewm \
	$(prefix)/bin/icewmbg \
	$(prefix)/bin/icewmhint \
	$(prefix)/bin/icewm-session \
	$(prefix)/bin/icewmtray
