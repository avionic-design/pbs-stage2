PACKAGE = pingus
VERSION = 0.7.2

GIT_URL = git://git.adnet.avionic-design.de/games/pingus.git
include packages/autotools-git.mk

conf-args += \
	--with-boost=$(SYSROOT)$(prefix) \
	--with-boost-signals=boost_signals

stripfiles = \
	$(prefix)/bin/pingus
