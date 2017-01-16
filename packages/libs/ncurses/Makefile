PACKAGE = ncurses
VERSION = 6.0
LICENSE = MIT

LOCATION = http://ftp.gnu.org/pub/gnu/ncurses
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

MAJOR = $(word 1,$(subst ., ,$(VERSION)))

include packages/autotools.mk

conf-args-$(CONFIG_UCLIBC) = \
	--without-cxx --without-cxx-bindings

conf-args += \
	--with-shared \
	--without-ada \
	--without-tests \
	--enable-pc-files \
	--with-pkg-config-libdir=$(prefix)/lib/pkgconfig \
	$(conf-args-y)

config-scriptfiles = \
	$(prefix)/bin/ncurses$(MAJOR)-config

stripfiles = \
	$(prefix)/bin/captoinfo \
	$(prefix)/bin/clear \
	$(prefix)/bin/infocmp \
	$(prefix)/bin/infotocap \
	$(prefix)/bin/reset \
	$(prefix)/bin/tabs \
	$(prefix)/bin/tic \
	$(prefix)/bin/toe \
	$(prefix)/bin/tput \
	$(prefix)/bin/tset \
	$(prefix)/lib/*.so.*
