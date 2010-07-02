PACKAGE = ORBit2
VERSION = 2.14.18

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/2.14
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
NUM_CPU := 1

conf-vars += \
	ac_cv_alignof_CORBA_octet=1 \
	ac_cv_alignof_CORBA_boolean=1 \
	ac_cv_alignof_CORBA_char=1 \
	ac_cv_alignof_CORBA_wchar=2 \
	ac_cv_alignof_CORBA_short=2 \
	ac_cv_alignof_CORBA_long=4 \
	ac_cv_alignof_CORBA_long_long=8 \
	ac_cv_alignof_CORBA_float=4 \
	ac_cv_alignof_CORBA_double=8 \
	ac_cv_alignof_CORBA_long_double=8 \
	ac_cv_alignof_CORBA_struct=1 \
	ac_cv_alignof_CORBA_pointer=4

plugin = $(prefix)/lib/orbit-2.0

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/ior-decode-2 \
	$(prefix)/bin/linc-cleanup-sockets \
	$(prefix)/bin/orbit-idl-2 \
	$(prefix)/bin/typelib-dump \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
