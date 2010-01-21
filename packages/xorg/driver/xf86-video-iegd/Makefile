PACKAGE = iegd
VERSION = 10.2.2

LOCATION =
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

xversion = 1.6.3
drvsrcdir = $(pkgbuildtree)/driver/Xorg-xserver-$(xversion)
moddstdir = $(prefix)/lib/xorg/modules
drvdstdir = $(moddstdir)/drivers
libdstdir = $(prefix)/lib
mandstdir = $(prefix)/share/man
dridstdir = $(libdstdir)/dri

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	mkdir -p $(DESTDIR)$(drvdstdir)
	mkdir -p $(DESTDIR)$(moddstdir)
	mkdir -p $(DESTDIR)$(libdstdir)
	mkdir -p $(DESTDIR)$(mandstdir)/man4
	mkdir -p $(DESTDIR)$(mandstdir)/man3x
	mkdir -p $(DESTDIR)$(dridstdir)
	# X.Org driver
	install $(drvsrcdir)/iegd_drv.so $(DESTDIR)$(drvdstdir)
	install $(drvsrcdir)/libXiegd_escape.so.2.0.0 $(DESTDIR)$(libdstdir)
	ln -s libXiegd_escape.so.2.0.0 $(DESTDIR)$(libdstdir)/libXiegd_escape.so.2
	ln -s libXiegd_escape.so.2.0.0 $(DESTDIR)$(libdstdir)/libXiegd_escape.so
	# port drivers
	install $(drvsrcdir)/analog.so $(DESTDIR)$(moddstdir)
	install $(drvsrcdir)/hdmi.so $(DESTDIR)$(moddstdir)
	install $(drvsrcdir)/lvds.so $(DESTDIR)$(moddstdir)
	install $(drvsrcdir)/sdvo.so $(DESTDIR)$(moddstdir)
	install $(drvsrcdir)/softpd.so $(DESTDIR)$(moddstdir)
	install $(drvsrcdir)/tv.so $(DESTDIR)$(moddstdir)
	# manpages
	install $(drvsrcdir)/iegd.4.gz $(DESTDIR)$(mandstdir)/man4
	install $(drvsrcdir)/iegd_escape.3x.gz $(DESTDIR)$(mandstdir)/man3x
	# OpenGL
	install $(drvsrcdir)/iegd_dri.so $(DESTDIR)$(dridstdir)
	install $(drvsrcdir)/libGL_ga.so.1.2 $(DESTDIR)$(libdstdir)/libGL.so.1.2
	ln -s libGL.so.1.2 $(DESTDIR)$(libdstdir)/libGL.so.1
	ln -s libGL.so.1.2 $(DESTDIR)$(libdstdir)/libGL.so
	# video decode files
	install $(drvsrcdir)/iegd_drv_video.so $(DESTDIR)$(drvdstdir)
	install $(drvsrcdir)/libva.so.0.29.0 $(DESTDIR)$(libdstdir)
	ln -s libva.so.0.29.0 $(DESTDIR)$(libdstdir)/libva.so.0
	ln -s libva.so.0.29.0 $(DESTDIR)$(libdstdir)/libva.so
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(dridstdir)/iegd_dri.so \
	$(libdstdir)/libGL.so.1.2 \
	$(libdstdir)/libva.so.0.29.0 \
	$(libdstdir)/libXiegd_escape.so.2.0.0 \
	$(drvdstdir)/iegd_drv.so \
	$(drvdstdir)/iegd_drv_video.so \
	$(moddstdir)/analog.so \
	$(moddstdir)/hdmi.so \
	$(moddstdir)/lvds.so \
	$(moddstdir)/sdvo.so \
	$(moddstdir)/softpd.so \
	$(moddstdir)/tv.so \

include packages/cleanup.mk
include packages/binary.mk
