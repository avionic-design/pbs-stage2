PACKAGE = icedtea
VERSION = 854406ecaf7f

LOCATION = http://icedtea.classpath.org/hg/icedtea/archive
TARBALLS = $(VERSION).tar.bz2;filename=icedtea-$(VERSION).tar.bz2

OPENJDK_CHANGESET = 195fcceefddc
HOTSPOT_CHANGESET = de6965fd4cc5
CORBA_CHANGESET = e805b4155d76
JAXP_CHANGESET = 826bafcb6c4a
JAXWS_CHANGESET = 1661166c82dc
LANGTOOLS_CHANGESET = 681f1f51926f
JDK_CHANGESET = 3d1a836736bf

HG_URL = http://hg.openjdk.java.net/icedtea/jdk7
JAXP_DROP_URL = https://jaxp.dev.java.net/files/documents/913/147490
JAXP_DROP_ZIP = jdk7-jaxp-m6.zip
JAF_DROP_URL = http://kenai.com/projects/jdk7-drops/downloads/download
JAF_DROP_ZIP = jdk7-jaf-2009_08_28.zip
JAXWS_DROP_URL = http://kenai.com/projects/jdk7-drops/downloads/download
JAXWS_DROP_ZIP = jdk7-jaxws-2009_09_28.zip

FILES = \
	$(HG_URL)/archive/$(OPENJDK_CHANGESET).tar.gz;filename=openjdk-$(OPENJDK_CHANGESET).tar.gz \
	$(HG_URL)/hotspot/archive/$(HOTSPOT_CHANGESET).tar.gz;filename=hotspot-$(HOTSPOT_CHANGESET).tar.gz \
	$(HG_URL)/corba/archive/$(CORBA_CHANGESET).tar.gz;filename=corba-$(CORBA_CHANGESET).tar.gz \
	$(HG_URL)/jaxp/archive/$(JAXP_CHANGESET).tar.gz;filename=jaxp-$(JAXP_CHANGESET).tar.gz \
	$(HG_URL)/jaxws/archive/$(JAXWS_CHANGESET).tar.gz;filename=jaxws-$(JAXWS_CHANGESET).tar.gz \
	$(HG_URL)/langtools/archive/$(LANGTOOLS_CHANGESET).tar.gz;filename=langtools-$(LANGTOOLS_CHANGESET).tar.gz \
	$(HG_URL)/jdk/archive/$(JDK_CHANGESET).tar.gz;filename=jdk-$(JDK_CHANGESET).tar.gz \
	$(JAXP_DROP_URL)/$(JAXP_DROP_ZIP) \
	$(JAF_DROP_URL)/$(JAF_DROP_ZIP) \
	$(JAXWS_DROP_URL)/$(JAXWS_DROP_ZIP)

JDK_ARCH = $(shell $(srctree)/support/openjdk-arch $(CONFIG_CPU))
JDK_LIBARCH = $(shell $(srctree)/support/openjdk-arch --install $(CONFIG_CPU))

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(SYSROOT)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-args += \
	--with-openjdk-src-zip=$(srctree)/download/openjdk-$(OPENJDK_CHANGESET).tar.gz \
	--with-hotspot-src-zip=$(srctree)/download/hotspot-$(HOTSPOT_CHANGESET).tar.gz \
	--with-corba-src-zip=$(srctree)/download/corba-$(CORBA_CHANGESET).tar.gz \
	--with-jaxp-src-zip=$(srctree)/download/jaxp-$(JAXP_CHANGESET).tar.gz \
	--with-jaxws-src-zip=$(srctree)/download/jaxws-$(JAXWS_CHANGESET).tar.gz \
	--with-langtools-src-zip=$(srctree)/download/langtools-$(LANGTOOLS_CHANGESET).tar.gz \
	--with-jdk-src-zip=$(srctree)/download/jdk-$(JDK_CHANGESET).tar.gz \
	--with-jaxp-drop-zip=$(srctree)/download/$(JAXP_DROP_ZIP) \
	--with-jaf-drop-zip=$(srctree)/download/$(JAF_DROP_ZIP) \
	--with-jaxws-drop-zip=$(srctree)/download/$(JAXWS_DROP_ZIP)

conf-args += \
	--with-jdk-home=$(objtree)/tools/j2sdk-image \
	--disable-bootstrap

ifneq ($(CONFIG_PACKAGE_JAVA_ICEDTEA_PLUGIN),y)
  conf-args += \
	--disable-plugin
endif

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	CXXFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && ./autogen.sh
	mkdir -p $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

srcdir = $(pkgbuildtree)/obj-$(HOST_GNU_TYPE)/openjdk/build/linux-$(JDK_ARCH)
jdk = $(prefix)/lib/jvm/java-7-openjdk
jre = $(jdk)/jre

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		$(priv) $(env) $(MAKE) $(install-args) install
ifneq ($(JDK_ARCH),$(JDK_LIBARCH))
	$(priv) mv $(srcdir)/j2sdk-image/jre/lib/$(JDK_LIBARCH)/IcedTeaNPPlugin.so \
		$(srcdir)/j2sdk-image/jre/lib/$(JDK_ARCH)
	$(priv) rm -r $(srcdir)/j2sdk-image/jre/lib/$(JDK_LIBARCH)
endif
	$(priv) mkdir -p $(DESTDIR)$(jdk) && \
		$(priv) cp -dpR $(srcdir)/j2sdk-image/* $(DESTDIR)$(jdk) && \
		$(priv) chown -R root:root $(DESTDIR)
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(jdk)/bin/appletviewer \
	$(jdk)/bin/apt \
	$(jdk)/bin/extcheck \
	$(jdk)/bin/idlj \
	$(jdk)/bin/jar \
	$(jdk)/bin/jarsigner \
	$(jdk)/bin/java \
	$(jdk)/bin/javac \
	$(jdk)/bin/javadoc \
	$(jdk)/bin/javah \
	$(jdk)/bin/javap \
	$(jdk)/bin/javaws \
	$(jdk)/bin/jconsole \
	$(jdk)/bin/jdb \
	$(jdk)/bin/jhat \
	$(jdk)/bin/jinfo \
	$(jdk)/bin/jmap \
	$(jdk)/bin/jps \
	$(jdk)/bin/jrunscript \
	$(jdk)/bin/jsadebugd \
	$(jdk)/bin/jstack \
	$(jdk)/bin/jstat \
	$(jdk)/bin/jstatd \
	$(jdk)/bin/keytool \
	$(jdk)/bin/native2ascii \
	$(jdk)/bin/orbd \
	$(jdk)/bin/pack200 \
	$(jdk)/bin/pluginappletviewer \
	$(jdk)/bin/policytool \
	$(jdk)/bin/rmic \
	$(jdk)/bin/rmid \
	$(jdk)/bin/rmiregistry \
	$(jdk)/bin/schemagen \
	$(jdk)/bin/serialver \
	$(jdk)/bin/servertool \
	$(jdk)/bin/tnameserv \
	$(jdk)/bin/unpack200 \
	$(jdk)/bin/wsgen \
	$(jdk)/bin/wsimport \
	$(jdk)/bin/xjc \
	$(jdk)/demo/jvmti/compiledMethodLoad/lib/libcompiledMethodLoad.so \
	$(jdk)/demo/jvmti/gctest/lib/libgctest.so \
	$(jdk)/demo/jvmti/heapTracker/lib/libheapTracker.so \
	$(jdk)/demo/jvmti/heapViewer/lib/libheapViewer.so \
	$(jdk)/demo/jvmti/hprof/lib/libhprof.so \
	$(jdk)/demo/jvmti/minst/lib/libminst.so \
	$(jdk)/demo/jvmti/mtrace/lib/libmtrace.so \
	$(jdk)/demo/jvmti/versionCheck/lib/libversionCheck.so \
	$(jdk)/demo/jvmti/waiters/lib/libwaiters.so \
	$(jre)/bin/java \
	$(jre)/bin/javaws \
	$(jre)/bin/keytool \
	$(jre)/bin/orbd \
	$(jre)/bin/pack200 \
	$(jre)/bin/pluginappletviewer \
	$(jre)/bin/policytool \
	$(jre)/bin/rmid \
	$(jre)/bin/rmiregistry \
	$(jre)/bin/servertool \
	$(jre)/bin/tnameserv \
	$(jre)/bin/unpack200 \
	$(jre)/lib/$(JDK_ARCH)/client/libjvm.so \
	$(jre)/lib/$(JDK_ARCH)/headless/libmawt.so \
	$(jre)/lib/$(JDK_ARCH)/IcedTeaNPPlugin.so \
	$(jre)/lib/$(JDK_ARCH)/jli/libjli.so \
	$(jre)/lib/$(JDK_ARCH)/libattach.so \
	$(jre)/lib/$(JDK_ARCH)/libawt.so \
	$(jre)/lib/$(JDK_ARCH)/libdt_socket.so \
	$(jre)/lib/$(JDK_ARCH)/libfontmanager.so \
	$(jre)/lib/$(JDK_ARCH)/libhprof.so \
	$(jre)/lib/$(JDK_ARCH)/libinstrument.so \
	$(jre)/lib/$(JDK_ARCH)/libj2gss.so \
	$(jre)/lib/$(JDK_ARCH)/libj2pcsc.so \
	$(jre)/lib/$(JDK_ARCH)/libj2pkcs11.so \
	$(jre)/lib/$(JDK_ARCH)/libjaas_unix.so \
	$(jre)/lib/$(JDK_ARCH)/libjava_crw_demo.so \
	$(jre)/lib/$(JDK_ARCH)/libjava.so \
	$(jre)/lib/$(JDK_ARCH)/libjawt.so \
	$(jre)/lib/$(JDK_ARCH)/libjdwp.so \
	$(jre)/lib/$(JDK_ARCH)/libjpeg.so \
	$(jre)/lib/$(JDK_ARCH)/libjsdt.so \
	$(jre)/lib/$(JDK_ARCH)/libjsig.so \
	$(jre)/lib/$(JDK_ARCH)/libjsoundalsa.so \
	$(jre)/lib/$(JDK_ARCH)/libjsound.so \
	$(jre)/lib/$(JDK_ARCH)/liblcms.so \
	$(jre)/lib/$(JDK_ARCH)/libmanagement.so \
	$(jre)/lib/$(JDK_ARCH)/libmlib_image.so \
	$(jre)/lib/$(JDK_ARCH)/libnet.so \
	$(jre)/lib/$(JDK_ARCH)/libnio.so \
	$(jre)/lib/$(JDK_ARCH)/libnpt.so \
	$(jre)/lib/$(JDK_ARCH)/librmi.so \
	$(jre)/lib/$(JDK_ARCH)/libsaproc.so \
	$(jre)/lib/$(JDK_ARCH)/libsctp.so \
	$(jre)/lib/$(JDK_ARCH)/libsplashscreen.so \
	$(jre)/lib/$(JDK_ARCH)/libunpack.so \
	$(jre)/lib/$(JDK_ARCH)/libverify.so \
	$(jre)/lib/$(JDK_ARCH)/libzip.so \
	$(jre)/lib/$(JDK_ARCH)/native_threads/libhpi.so \
	$(jre)/lib/$(JDK_ARCH)/server/libjvm.so \
	$(jre)/lib/$(JDK_ARCH)/xawt/libmawt.so \
	$(jre)/lib/jexec \
	$(jdk)/lib/jexec

include packages/cleanup.mk
include packages/binary.mk
