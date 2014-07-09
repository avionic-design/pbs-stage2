include packages/autotools.mk

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args += \
	--with-sysroot=$(SYSROOT)
