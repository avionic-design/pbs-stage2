PACKAGE = pingus
VERSION = 0.7.2

GITTREE = $(srctree)/../games/pingus-0.7.2

include packages/autotools-git.mk

conf-args += \
	--with-boost=$(SYSROOT)$(prefix) \
	--with-boost-signals=boost_signals

stripfiles = \
	$(prefix)/bin/pingus
