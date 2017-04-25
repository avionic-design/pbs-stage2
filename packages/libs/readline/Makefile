PACKAGE = readline
VERSION = 7.0
LICENSE = GPL

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-curses

conf-vars += \
	bash_cv_wcwidth_broken=no

ifeq ($(CONFIG_PACKAGE_LIBS_NCURSES_WIDECHAR),y)
  build-args += SHLIB_LIBS="-lncursesw"
else
  build-args += SHLIB_LIBS="-lncurses"
endif

prunefiles =
stripfiles = \
	$(prefix)/lib/libhistory.so.$(VERSION) \
	$(prefix)/lib/libreadline.so.$(VERSION)
