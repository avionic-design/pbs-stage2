include packages/libs/gettext/Makefile.location
include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-openmp \
	--disable-rpath \
	--disable-curses

conf-vars += \
	am_cv_func_iconv_works=yes

prunefiles = \
	$(prefix)/lib/libasprintf.la \
	$(prefix)/lib/libgettextlib.la \
	$(prefix)/lib/libgettextpo.la \
	$(prefix)/lib/libgettextsrc.la

ifneq ($(LIBC),gnu)
prunefiles += \
	$(prefix)/lib/libintl.la
endif

lib-version  = $(VERSION)
po-version   = 0.5.1
intl-version = 8.0.2
plugin       = $(prefix)/lib/gettext

stripfiles = \
	$(prefix)/bin/envsubst \
	$(prefix)/bin/gettext \
	$(prefix)/bin/msgattrib \
	$(prefix)/bin/msgcat \
	$(prefix)/bin/msgcmp \
	$(prefix)/bin/msgcomm \
	$(prefix)/bin/msgconv \
	$(prefix)/bin/msgen \
	$(prefix)/bin/msgexec \
	$(prefix)/bin/msgfilter \
	$(prefix)/bin/msgfmt \
	$(prefix)/bin/msggrep \
	$(prefix)/bin/msginit \
	$(prefix)/bin/msgmerge \
	$(prefix)/bin/msgunfmt \
	$(prefix)/bin/msguniq \
	$(prefix)/bin/ngettext \
	$(prefix)/bin/recode-sr-latin \
	$(prefix)/bin/xgettext \
	$(prefix)/lib/libasprintf.so.0.0.0 \
	$(prefix)/lib/libgettextlib-$(lib-version).so \
	$(prefix)/lib/libgettextpo.so.$(po-version) \
	$(prefix)/lib/libgettextsrc-$(lib-version).so \
	$(plugin)/hostname \
	$(plugin)/urlget

ifneq ($(LIBC),gnu)
stripfiles += \
	$(prefix)/lib/libintl.so.$(intl-version)
endif
