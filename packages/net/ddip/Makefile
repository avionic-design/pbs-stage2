PACKAGE = ddip
VERSION = git

GIT_URL = git://git.adnet.avionic-design.de/avionic-design/ddip.git
include packages/autotools-git.mk

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/ddip-announce \
	$(prefix)/bin/ddip-discover \
	$(prefix)/lib/*.so.*
