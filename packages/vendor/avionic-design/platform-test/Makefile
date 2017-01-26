PACKAGE = platform-test
VERSION = git

GIT_URL = http://review.adnet.avionic-design.de/avionic-design/platform-test.git

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix) \
	sysconfdir=/etc

$(pkgtree)/.do-install: $(pkgtree)/.setup
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
