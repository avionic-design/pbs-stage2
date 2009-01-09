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

package-do-install:
	cd $(pkgtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libQt3Support.la \
	$(prefix)/lib/libQt3Support.prl \
	$(prefix)/lib/libQtSvg.la \
	$(prefix)/lib/libQtSvg.prl \
	$(prefix)/lib/libQtNetwork.la \
	$(prefix)/lib/libQtNetwork.prl \
	$(prefix)/lib/libQtCore.la \
	$(prefix)/lib/libQtCore.prl \
	$(prefix)/lib/libQtTest.la \
	$(prefix)/lib/libQtTest.prl \
	$(prefix)/lib/libQtGui.la \
	$(prefix)/lib/libQtGui.prl \
	$(prefix)/lib/libQtXml.la \
	$(prefix)/lib/libQtXml.prl \
	$(prefix)/lib/libQtScript.la \
	$(prefix)/lib/libQtScript.prl \
	$(prefix)/lib/libQtSql.la \
	$(prefix)/lib/libQtSql.prl

sover = $(VERSION)
plugin-dir = $(prefix)/plugins

stripfiles = \
	$(prefix)/lib/libQt3Support.so.$(sover) \
	$(prefix)/lib/libQtCore.so.$(sover) \
	$(prefix)/lib/libQtGui.so.$(sover) \
	$(prefix)/lib/libQtNetwork.so.$(sover) \
	$(prefix)/lib/libQtScript.so.$(sover) \
	$(prefix)/lib/libQtSql.so.$(sover) \
	$(prefix)/lib/libQtSvg.so.$(sover) \
	$(prefix)/lib/libQtTest.so.$(sover) \
	$(prefix)/lib/libQtXml.so.$(sover) \
	$(plugin-dir)/iconengines/*.so \
	$(plugin-dir)/accessible/*.so \
	$(plugin-dir)/sqldrivers/*.so \
	$(plugin-dir)/imageformats/*.so \
	$(tools-dir)/echoplugin/plugin/*.so \
	$(tools-dir)/styleplugin/styles/*.so \
	$(tools-dir)/plugandpaint/plugins/*.so

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

