PACKAGE = alsa-utils
VERSION = 1.0.20

LOCATION = ftp://ftp.alsa-project.org/pub/utils
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-vars += \
	ac_cv_prog_ncurses5_config=$(srctree)/support/ncurses5-config

stripfiles = \
	$(prefix)/bin/aconnect \
	$(prefix)/bin/alsamixer \
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
