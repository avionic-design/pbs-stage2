PACKAGE = icedtea
VERSION = git

LOCATION = http://icedtea.classpath.org/download/source
TARBALLS =

JDK_ARCH = $(shell $(srctree)/support/openjdk-arch $(CONFIG_CPU))
GITTREE = $(srctree)/../java/icedtea.hg

include packages/common.mk

HOST_GNU_TYPE = $(shell $(srctree)/support/config.sub $(TARGET))
BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

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

collapse = $(shell printf "%u%02u%02u%02u" $1 $2 $3 $4)
XUL_VERSION = $(shell $(env) pkg-config --modversion mozilla-plugin)
XUL_VERSION_MAJOR = $(shell echo $(XUL_VERSION) | cut -d. -f1)
XUL_VERSION_MINOR = $(shell echo $(XUL_VERSION) | cut -d. -f2)
XUL_VERSION_MICRO = $(shell echo $(XUL_VERSION) | cut -d. -f3)
XUL_VERSION_PATCH = $(shell echo $(XUL_VERSION) | cut -d. -f4)

conf-vars += \
	xulrunner_cv_collapsed_version=$(call collapse, $(XUL_VERSION_MAJOR), $(XUL_VERSION_MINOR), $(XUL_VERSION_MICRO), $(XUL_VERSION_PATCH))

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
			$(env) $(GITTREE)/configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

srcdir = $(pkgbuildtree)/obj-$(HOST_GNU_TYPE)/openjdk/build/linux-$(JDK_ARCH)

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) mkdir -p $(DESTDIR)$(prefix)/lib/jvm/java-7-openjdk && \
		$(priv) cp -dpR $(srcdir)/j2sdk-image/* \
			$(DESTDIR)$(prefix)/lib/jvm/java-7-openjdk && \
		$(priv) chown -R root:root $(DESTDIR)
	$(call cmd,stamp)

jdk = $(prefix)/lib/jvm/java-7-openjdk
jre = $(jdk)/jre

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
	$(jre)/bin/policytool \
	$(jre)/bin/rmid \
	$(jre)/bin/rmiregistry \
	$(jre)/bin/servertool \
	$(jre)/bin/tnameserv \
	$(jre)/bin/unpack200 \
	$(jre)/lib/$(JDK_ARCH)/client/libjvm.so \
	$(jre)/lib/$(JDK_ARCH)/headless/libmawt.so \
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
