PACKAGE = grep
VERSION = 2.13
LICENSE = GPL

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifneq ($(LIBC),gnu)
conf-vars += \
	ac_cv_func_mempcpy=no
endif

stripfiles = \
	$(prefix)/bin/egrep \
	$(prefix)/bin/fgrep \
	$(prefix)/bin/grep
