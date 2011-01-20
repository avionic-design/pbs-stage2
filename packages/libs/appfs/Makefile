PACKAGE = appfs
VERSION = git

GIT_URL = git://git.adnet.avionic-design.de/git/avionic-design/appfs.git
include packages/autotools-git.mk

conf-args += \
	--disable-shared

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
