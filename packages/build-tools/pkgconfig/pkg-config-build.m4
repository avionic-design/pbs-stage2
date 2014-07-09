#!/bin/sh

export PKG_CONFIG_LIBDIR=BUILD_TOOLS/lib/pkgconfig:BUILD_TOOLS/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=

exec BUILD_TOOLS/bin/pkg-config "$@"
