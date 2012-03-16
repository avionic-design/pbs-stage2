PACKAGE = ptip-classic
VERSION = 0.0.0
LICENSE = GPL

GIT_URL = git://git.adnet.avionic-design.de/avionic-design/ptip.git

include packages/autotools-git.mk

conf-args += \
	--enable-maintainer-mode \
	--with-keypad \
	--with-framebuffer \
	--with-linphone

stripfiles = \
        $(prefix)/bin/ptip
