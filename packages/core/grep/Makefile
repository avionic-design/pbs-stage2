PACKAGE = grep
VERSION = 2.5.4

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-nls

# use the following to remove dependency on pcre
#conf-args += \
#	--disable-perl-regexp

conf-vars += \
	PCRE_CPPFLAGS="--sysroot $(SYSROOT)" \
	PCRE_LIBS="-lpcre"

ifneq ($(LIBC),gnu)
conf-vars += \
	ac_cv_func_mempcpy=no
endif

prunefiles =
stripfiles = \
	$(prefix)/bin/egrep \
	$(prefix)/bin/fgrep \
	$(prefix)/bin/grep
