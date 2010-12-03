PACKAGE = ddip
VERSION = git

GITTREE = $(srctree)/../avionic-design/ddip.git
include packages/autotools-git.mk

conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/ddip-announce \
	$(prefix)/bin/ddip-discover \
	$(prefix)/lib/*.so.*
