PACKAGE = xdgmime
VERSION = 0.0

GIT_URL = git://git.adnet.avionic-design.de/fdo/xdg/xdgmime.git
GIT_CHECKOUT = master

include packages/autotools-git.mk

conf-args += \
	ac_cv_func_mmap_fixed_mapped=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
