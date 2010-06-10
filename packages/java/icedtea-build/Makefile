PACKAGE = icedtea
VERSION = git

LOCATION = http://icedtea.classpath.org/download/source
TARBALLS =

JDK_ARCH = $(shell $(srctree)/support/openjdk-arch)
GITTREE = $(srctree)/../java/icedtea.hg

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--with-openjdk-src-zip=$(srctree)/build/openjdk.tar.gz \
	--with-hotspot-src-zip=$(srctree)/build/hotspot.tar.gz \
	--with-corba-src-zip=$(srctree)/build/corba.tar.gz \
	--with-jaxp-src-zip=$(srctree)/build/jaxp.tar.gz \
	--with-jaxws-src-zip=$(srctree)/build/jaxws.tar.gz \
	--with-langtools-src-zip=$(srctree)/build/langtools.tar.gz \
	--with-jdk-src-zip=$(srctree)/build/jdk.tar.gz \
	--with-jaxp-drop-zip=$(srctree)/build/drops/jdk7-jaxp-m6.zip \
	--with-jaf-drop-zip=$(srctree)/build/drops/jdk7-jaf-2009_08_28.zip \
	--with-jaxws-drop-zip=$(srctree)/build/drops/jdk7-jaxws-2009_09_28.zip

conf-args += \
	--disable-plugin

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/build && \
		cd $(pkgbuildtree)/build && \
			env -i PATH=$(PATH) $(GITTREE)/configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/build && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

BASE = $(pkgbuildtree)/build/openjdk/build/linux-$(JDK_ARCH)

$(pkgtree)/.do-install: $(pkgtree)/.build
	mkdir -p $(objtree)/tools && \
		ln -sf $(BASE)/j2sdk-image $(objtree)/tools
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.do-install
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(call cmd,stamp)
