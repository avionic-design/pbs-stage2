PACKAGE = qt-embedded-linux-opensource-src
VERSION = 4.4.0

LOCATION = ftp://ftp.trolltech.com/qt/source
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

conf-args = \
	-prefix $(prefix) \
	-embedded arm \
	-little-endian

package-configure:
	cd $(pkgtree) && \
		echo yes | $(env) ./configure $(conf-args) $(conf-vars)

build-args = \
	CC='$(CC)' \
	CXX='$(CXX)' \
	LINK='$(CXX)' \
	AR='$(AR) cqs' \
	RANLIB='$(RANLIB)'

package-build:
	cd $(pkgtree) && \
		$(env) $(MAKE) sub-moc-all sub-rcc-all sub-uic-all
	cd $(pkgtree) && \
		$(env) $(MAKE) $(build-args)
#		$(env) $(MAKE) $(build-args) \
			sub-corelib-all \
			sub-xml-all \
			sub-network-all \
			sub-gui-all \
			sub-sql-all \
			sub-script-all \
			sub-testlib-all \
			sub-qt3support-all \
			sub-svg-all \
			sub-plugins-all \
			sub-examples-all \
			sub-demos-all

install-args = \
	CC='$(CC)' \
	CXX='$(CXX)' \
	LINK='$(CXX)' \
	AR='$(AR) cqs' \
	RANLIB='$(RANLIB)' \
	INSTALL_ROOT=$(ROOTFS)

sover = $(VERSION)
plugin-dir = $(prefix)/plugins

libs-strip = \
	$(prefix)/lib/libQt3Support.so.$(sover) \
	$(prefix)/lib/libQtCore.so.$(sover) \
	$(prefix)/lib/libQtGui.so.$(sover) \
	$(prefix)/lib/libQtNetwork.so.$(sover) \
	$(prefix)/lib/libQtScript.so.$(sover) \
	$(prefix)/lib/libQtSql.so.$(sover) \
	$(prefix)/lib/libQtSvg.so.$(sover) \
	$(prefix)/lib/libQtTest.so.$(sover) \
	$(prefix)/lib/libQtXml.so.$(sover) \
	$(plugin-dir)/iconengines/libqsvgicon.so \
	$(plugin-dir)/accessible/libqtaccessiblewidgets.so \
	$(plugin-dir)/accessible/libqtaccessiblecompatwidgets.so \
	$(plugin-dir)/sqldrivers/libqsqlite.so \
	$(plugin-dir)/imageformats/libqjpeg.so \
	$(plugin-dir)/imageformats/libqmng.so \
	$(plugin-dir)/imageformats/libqico.so \
	$(plugin-dir)/imageformats/libqsvg.so \
	$(plugin-dir)/imageformats/libqtiff.so \
	$(plugin-dir)/imageformats/libqgif.so \
	$(tools-dir)/echoplugin/plugin/libechoplugin.so \
	$(tools-dir)/styleplugin/styles/libsimplestyleplugin.so \
	$(tools-dir)/plugandpaint/plugins/libpnp_extrafilters.so

libs-strip := $(patsubst %,strip-$(ROOTFS)%,$(libs-strip))

$(libs-strip): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

_strip: $(libs-strip)
	@:

package-install: _package-install _strip
	@:

_package-install:
	cd $(pkgtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQt3Support.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtSvg.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtNetwork.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtCore.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtTest.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtGui.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtXml.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtScript.{la,prl}
	$(priv) rm $(ROOTFS)$(prefix)/lib/libQtSql.{la,prl}

package-clean:
	@:

