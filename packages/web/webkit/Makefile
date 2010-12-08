PACKAGE = webkit
VERSION = git

GIT_URL = git://git.webkit.org/WebKit.git
include packages/autotools-git.mk

conf-args += \
	--with-unicode-backend=icu \
	--disable-video

conf-vars += \
	ac_cv_path_icu_config='$(SYSROOT)$(prefix)/bin/icu-config' \
	ac_cv_path_PKG_CONFIG=$(TARGET)-pkg-config

prunefiles = \
	$(prefix)/lib/libwebkit-1.0.la

stripfiles = \
	$(prefix)/bin/jsc \
	$(prefix)/lib/libwebkit-1.0.so.2.8.0
