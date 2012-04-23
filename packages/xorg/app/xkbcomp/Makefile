PACKAGE = xkbcomp
VERSION = 1.2.4

include packages/xorg/app/common.mk

xkbparse_c := $(pkgbuildtree)/xkbparse.c
xkbparse_c := $(subst .,_,$(xkbparse_c))
xkbparse_c := $(subst /,_,$(xkbparse_c))
xkbparse_c := $(subst -,_,$(xkbparse_c))

conf-args += \
	ac_cv_file_$(xkbparse_c)=yes

stripfiles = \
	$(prefix)/bin/xkbcomp
