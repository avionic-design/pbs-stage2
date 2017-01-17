PACKAGE = minicom
VERSION = 2.7

LOCATION = https://alioth.debian.org/frs/download.php/file/3977
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

DESCRIPTION = friendly menu-driven serial communication program

include packages/autotools.mk

conf-args += \
	--enable-silent-rules

ifneq ($(CONFIG_LIBC),gnu)
conf-vars += \
	LIBS='-liconv'
endif

ifeq ($(CONFIG_PACKAGE_LIBS_NCURSES_WIDECHAR),y)
  conf-vars += LDFLAGS='-lncursesw'
endif

stripfiles = \
	$(prefix)/bin/ascii-xfr \
	$(prefix)/bin/minicom \
	$(prefix)/bin/runscript
