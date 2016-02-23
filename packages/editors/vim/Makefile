PACKAGE = vim
VERSION = 7.4

LOCATION = http://ftp.vim.org/pub/vim/unix
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

pkgbuildtree = $(pkgtree)/$(PACKAGE)$(subst .,,$(VERSION))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-args += \
	--with-tlib=ncurses \
	--enable-gui=no

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

conf-vars += \
	ac_cv_small_wchar_t=yes \
	vim_cv_toupper_broken=no \
	vim_cv_terminfo=yes \
	vim_cv_tty_mode=0620 \
	vim_cv_tty_group=tty \
	vim_cv_getcwd_broken=no \
	vim_cv_stat_ignores_slash=yes \
	vim_cv_memmove_handles_overlap=yes

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DESTDIR=$(DESTDIR) \
	STRIP=$(STRIP)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
