PACKAGE = glshim
VERSION = 0.42
LICENSE = MIT

LOCATION = https://github.com/lunixbochs/glshim/archive/
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/cmake.mk

$(pkgtree)/symlinks:
	mkdir -p $(DESTDIR)$(prefix)/lib
	cd $(DESTDIR)$(prefix)/lib && { \
		ln -sf glshim/libGL.so ; \
		ln -sf glshim/libGL.so.1 ; \
		ln -sf glshim/libGL.so.1.2.0 ; \
	}

$(pkgtree)/.do-install: $(pkgtree)/symlinks

stripfiles = \
	$(prefix)/lib/glshim/*.so.*
