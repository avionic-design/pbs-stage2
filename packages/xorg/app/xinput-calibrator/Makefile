PACKAGE = xinput_calibrator
VERSION = 0.7.5

LOCATION = http://github.com/downloads/tias/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-gui=x11

stripfiles = \
	$(prefix)/bin/xinput_calibrator
