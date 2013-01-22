PACKAGE = v4l-utils
VERSION = 0.9.3
LICENSE = LGPL

LOCATION = http://linuxtv.org/downloads/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la \
	$(prefix)/lib/libv4l/plugins/*.la \
	$(prefix)/lib/libv4l/*.la

stripfiles = \
	$(prefix)/bin/cx18-ctl \
	$(prefix)/bin/decode_tm6000 \
	$(prefix)/bin/dvb-fe-tool \
	$(prefix)/bin/dvb-format-convert \
	$(prefix)/bin/dvbv5-scan \
	$(prefix)/bin/dvbv5-zap \
	$(prefix)/bin/ir-keytable \
	$(prefix)/bin/ivtv-ctl \
	$(prefix)/bin/rds-ctl \
	$(prefix)/bin/v4l2-compliance \
	$(prefix)/bin/v4l2-ctl \
	$(prefix)/bin/v4l2-sysfs-path \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/libv4l/plugins/*.so \
	$(prefix)/lib/libv4l/ov511-decomp \
	$(prefix)/lib/libv4l/ov518-decomp \
	$(prefix)/lib/libv4l/v4l1compat.so \
	$(prefix)/lib/libv4l/v4l2convert.so \
	$(prefix)/sbin/v4l2-dbg
