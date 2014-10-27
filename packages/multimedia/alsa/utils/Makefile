PACKAGE = alsa-utils
VERSION = 1.0.28
LICENSE = GPL

LOCATION = ftp://ftp.alsa-project.org/pub/utils
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-asound-state-dir=\$${sysconfdir} \
	--disable-xmlto

conf-vars += \
	ac_cv_prog_ncursesw5_config=no \
	ac_cv_prog_ncurses5_config=no

stripfiles = \
	$(prefix)/bin/aconnect \
	$(prefix)/bin/alsaloop \
	$(prefix)/bin/alsamixer \
	$(prefix)/bin/alsaucm \
	$(prefix)/bin/amidi \
	$(prefix)/bin/amixer \
	$(prefix)/bin/aplay \
	$(prefix)/bin/aplaymidi \
	$(prefix)/bin/arecordmidi \
	$(prefix)/bin/aseqdump \
	$(prefix)/bin/aseqnet \
	$(prefix)/bin/iecset \
	$(prefix)/bin/speaker-test \
	$(prefix)/sbin/alsactl
