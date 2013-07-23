PACKAGE = ncurses
VERSION = 5.9
LICENSE = MIT

LOCATION = http://ftp.gnu.org/pub/gnu/ncurses
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args-$(CONFIG_UCLIBC) = \
	--without-cxx --without-cxx-bindings

conf-args += \
	--with-shared \
	--without-ada \
	--without-manpages \
	--without-tests \
	$(conf-args-y)

prunefiles = \
	$(prefix)/bin/ncurses5-config

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
