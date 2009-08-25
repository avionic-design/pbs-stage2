PACKAGE = ncurses
VERSION = 5.7

LOCATION = ftp://ftp.gnu.org/gnu/ncurses
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-shared

sover = 5.7

prunefiles = \
	$(prefix)/bin/ncurses5-config

stripfiles = \
	$(prefix)/bin/captoinfo \
	$(prefix)/bin/clear \
	$(prefix)/bin/infocmp \
	$(prefix)/bin/infotocap \
	$(prefix)/bin/reset \
	$(prefix)/bin/tic \
	$(prefix)/bin/toe \
	$(prefix)/bin/tput \
	$(prefix)/bin/tset \
	$(prefix)/lib/libform.so.$(sover) \
	$(prefix)/lib/libmenu.so.$(sover) \
	$(prefix)/lib/libncurses.so.$(sover) \
	$(prefix)/lib/libpanel.so.$(sover)
