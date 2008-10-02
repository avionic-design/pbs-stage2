# select kernel version
ifeq ($(LINUX_VERSION),git)
  packages-y = kernel/linux.git
else
  packages-y = kernel/linux
endif

# select C library
ifeq ($(TARGET_LIBC),uclibc)
  packages-y += devel/uclibc
else
  packages-y += devel/glibc
endif

# select busybox variant
ifeq ($(TARGET_BUSYBOX),static)
  packages-y += core/busybox-static
else
  packages-y += core/busybox
endif

packages-y += core/udev

# common packages
ifneq ($(findstring qt, $(VARIANT)),)
  packages-y += libs/qt
else
  ifneq ($(VARIANT),alsa)
    packages-y += core/udev
    packages-y += libs/zlib
    packages-y += libs/libpng
    packages-y += libs/libjpeg
    packages-y += libs/expat
    packages-y += libs/iconv
    packages-y += libs/gettext
    packages-y += libs/glib
    packages-y += libs/tslib
  endif
endif

ifneq ($(findstring directfb, $(VARIANT)),)
  packages-y += libs/directfb

  cairo-y    += libs/cairo-dfb
  pango-y    += libs/pango-dfb
  gtk-y      += libs/gtk-dfb
endif

ifneq ($(findstring kdrive, $(VARIANT)),)
  packages-y += libs/openssl
  packages-y += xorg/proto/xcb
  packages-y += xorg/proto/x
  packages-y += xorg/proto/xext
  packages-y += xorg/proto/xcmisc
  packages-y += xorg/proto/scrnsaver
  packages-y += xorg/proto/bigreqs
  packages-y += xorg/proto/fontcache
  packages-y += xorg/proto/fonts
  packages-y += xorg/proto/resource
  packages-y += xorg/proto/trap
  packages-y += xorg/proto/evie
  packages-y += xorg/proto/kb
  packages-y += xorg/proto/input
  packages-y += xorg/proto/render
  packages-y += xorg/proto/randr
  packages-y += xorg/proto/fixes
  packages-y += xorg/proto/damage
  packages-y += xorg/proto/composite
  packages-y += xorg/proto/video
  packages-y += xorg/lib/xau
  packages-y += xorg/lib/pthread-stubs
  packages-y += xorg/lib/xcb
  packages-y += xorg/lib/xtrans
  packages-y += xorg/lib/xdmcp
  packages-y += xorg/lib/x11
  packages-y += xorg/lib/xext
  packages-y += xorg/lib/xkbfile
  packages-y += xorg/lib/fontenc
  packages-y += xorg/lib/xfont
  packages-y += xorg/lib/xrender
  packages-y += xorg/lib/xv
  packages-y += libs/dbus
  packages-y += libs/dbus-glib
  packages-y += libs/hal
  packages-y += libs/pixman
  packages-y += xorg/kdrive

  cairo-y    += libs/cairo-x
  pango-y    += libs/pango-x
  gtk-y      += libs/gtk-x
endif

ifneq ($(findstring gtk, $(VARIANT)),)
  packages-y += libs/freetype
  packages-y += libs/fontconfig
  packages-y += $(cairo-y)
  packages-y += $(pango-y)
  packages-y += libs/atk
  packages-y += $(gtk-y)
endif

ifneq ($(findstring alsa, $(VARIANT)),)
  packages-y += libs/ncurses
  packages-y += sound/alsa-lib
  packages-y += sound/alsa-utils
  packages-y += multimedia/libmad
  packages-y += multimedia/mpeg2dec
  packages-y += multimedia/admp.git
endif

ifneq ($(findstring webkit, $(VARIANT)),)
  packages-y += libs/icu
  packages-y += web/webkit
endif

