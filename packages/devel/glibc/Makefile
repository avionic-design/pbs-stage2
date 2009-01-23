PACKAGE = glibc
VERSION = 2.9

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

DESCRIPTION = the GNU C library

##############################################################################

include packages/common.mk

# always optimize glibc for speed (it won't even compile with -Os)
CFLAGS := $(patsubst -O%,-O2,$(CFLAGS))

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--with-headers=$(ROOTFS)$(prefix)/include \
	--enable-addons=ports

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

#	libc_cv_$(ARCH)_tls=yes \

#conf-vars += \
	ac_cv_lib_cap_cap_init=no \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	LDFLAGS='$(LDFLAGS)'

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

ifeq ($(ARCH),arm)
  ifeq ($(CPU),xscale)
	conf-vars += \
		ac_cv_sizeof_long_double=8
  endif
endif

ifeq ($(ARCH),i686)
	conf-vars += \
		ac_cv_sizeof_long_double=8 \
		CFLAGS='-march=i686 -O2 -g'
endif

ifeq ($(ARCH),i786)
	conf-vars += \
		ac_cv_sizeof_long_double=8 \
		CFLAGS='-march=prescott -O2 -g'
endif

ifeq ($(ARCH),x86_64)
	conf-vars += \
		ac_cv_sizeof_long_double=16
endif

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	MAKEFLAGS=

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args) all

install-args = \
	install_root=$(ROOTFS)

LIBGCC = $(shell $(CC) --print-file-name=libgcc_s.so.1)
plugin = $(prefix)/lib/gconv

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,install_bin,$(LIBGCC),$(ROOTFS)/lib/$(notdir $(LIBGCC)))

stripfiles = \
	/lib/$(notdir $(LIBGCC)) \
	/lib/ld-$(VERSION).so \
	/lib/libanl-$(VERSION).so \
	/lib/libBrokenLocale-$(VERSION).so \
	/lib/libc-$(VERSION).so \
	/lib/libcrypt-$(VERSION).so \
	/lib/libdl-$(VERSION).so \
	/lib/libm-$(VERSION).so \
	/lib/libmemusage.so \
	/lib/libnsl-$(VERSION).so \
	/lib/libnss_compat-$(VERSION).so \
	/lib/libnss_dns-$(VERSION).so \
	/lib/libnss_files-$(VERSION).so \
	/lib/libnss_hesiod-$(VERSION).so \
	/lib/libnss_nis-$(VERSION).so \
	/lib/libnss_nisplus-$(VERSION).so \
	/lib/libpcprofile.so \
	/lib/libpthread-$(VERSION).so \
	/lib/libresolv-$(VERSION).so \
	/lib/librt-$(VERSION).so \
	/lib/libSegFault.so \
	/lib/libthread_db-1.0.so \
	/lib/libutil-$(VERSION).so \
	/sbin/ldconfig \
	/sbin/sln \
	$(prefix)/bin/gencat \
	$(prefix)/bin/getconf \
	$(prefix)/bin/getent \
	$(prefix)/bin/iconv \
	$(prefix)/bin/locale \
	$(prefix)/bin/localedef \
	$(prefix)/bin/pcprofiledump \
	$(prefix)/bin/rpcgen \
	$(prefix)/bin/sprof \
	$(prefix)/libexec/pt_chown \
	$(prefix)/sbin/iconvconfig \
	$(prefix)/sbin/nscd \
	$(prefix)/sbin/rpcinfo \
	$(prefix)/sbin/zdump \
	$(prefix)/sbin/zic \
	$(plugin)/ANSI_X3.110.so \
	$(plugin)/ARMSCII-8.so \
	$(plugin)/ASMO_449.so \
	$(plugin)/BIG5HKSCS.so \
	$(plugin)/BIG5.so \
	$(plugin)/BRF.so \
	$(plugin)/CP10007.so \
	$(plugin)/CP1125.so \
	$(plugin)/CP1250.so \
	$(plugin)/CP1251.so \
	$(plugin)/CP1252.so \
	$(plugin)/CP1253.so \
	$(plugin)/CP1254.so \
	$(plugin)/CP1255.so \
	$(plugin)/CP1256.so \
	$(plugin)/CP1257.so \
	$(plugin)/CP1258.so \
	$(plugin)/CP737.so \
	$(plugin)/CP775.so \
	$(plugin)/CP932.so \
	$(plugin)/CSN_369103.so \
	$(plugin)/CWI.so \
	$(plugin)/DEC-MCS.so \
	$(plugin)/EBCDIC-AT-DE-A.so \
	$(plugin)/EBCDIC-AT-DE.so \
	$(plugin)/EBCDIC-CA-FR.so \
	$(plugin)/EBCDIC-DK-NO-A.so \
	$(plugin)/EBCDIC-DK-NO.so \
	$(plugin)/EBCDIC-ES-A.so \
	$(plugin)/EBCDIC-ES.so \
	$(plugin)/EBCDIC-ES-S.so \
	$(plugin)/EBCDIC-FI-SE-A.so \
	$(plugin)/EBCDIC-FI-SE.so \
	$(plugin)/EBCDIC-FR.so \
	$(plugin)/EBCDIC-IS-FRISS.so \
	$(plugin)/EBCDIC-IT.so \
	$(plugin)/EBCDIC-PT.so \
	$(plugin)/EBCDIC-UK.so \
	$(plugin)/EBCDIC-US.so \
	$(plugin)/ECMA-CYRILLIC.so \
	$(plugin)/EUC-CN.so \
	$(plugin)/EUC-JISX0213.so \
	$(plugin)/EUC-JP-MS.so \
	$(plugin)/EUC-JP.so \
	$(plugin)/EUC-KR.so \
	$(plugin)/EUC-TW.so \
	$(plugin)/GB18030.so \
	$(plugin)/GBBIG5.so \
	$(plugin)/GBGBK.so \
	$(plugin)/GBK.so \
	$(plugin)/GEORGIAN-ACADEMY.so \
	$(plugin)/GEORGIAN-PS.so \
	$(plugin)/GOST_19768-74.so \
	$(plugin)/GREEK7-OLD.so \
	$(plugin)/GREEK7.so \
	$(plugin)/GREEK-CCITT.so \
	$(plugin)/HP-ROMAN8.so \
	$(plugin)/IBM037.so \
	$(plugin)/IBM038.so \
	$(plugin)/IBM1004.so \
	$(plugin)/IBM1008_420.so \
	$(plugin)/IBM1008.so \
	$(plugin)/IBM1025.so \
	$(plugin)/IBM1026.so \
	$(plugin)/IBM1046.so \
	$(plugin)/IBM1047.so \
	$(plugin)/IBM1097.so \
	$(plugin)/IBM1112.so \
	$(plugin)/IBM1122.so \
	$(plugin)/IBM1123.so \
	$(plugin)/IBM1124.so \
	$(plugin)/IBM1129.so \
	$(plugin)/IBM1130.so \
	$(plugin)/IBM1132.so \
	$(plugin)/IBM1133.so \
	$(plugin)/IBM1137.so \
	$(plugin)/IBM1140.so \
	$(plugin)/IBM1141.so \
	$(plugin)/IBM1142.so \
	$(plugin)/IBM1143.so \
	$(plugin)/IBM1144.so \
	$(plugin)/IBM1145.so \
	$(plugin)/IBM1146.so \
	$(plugin)/IBM1147.so \
	$(plugin)/IBM1148.so \
	$(plugin)/IBM1149.so \
	$(plugin)/IBM1153.so \
	$(plugin)/IBM1154.so \
	$(plugin)/IBM1155.so \
	$(plugin)/IBM1156.so \
	$(plugin)/IBM1157.so \
	$(plugin)/IBM1158.so \
	$(plugin)/IBM1160.so \
	$(plugin)/IBM1161.so \
	$(plugin)/IBM1162.so \
	$(plugin)/IBM1163.so \
	$(plugin)/IBM1164.so \
	$(plugin)/IBM1166.so \
	$(plugin)/IBM1167.so \
	$(plugin)/IBM12712.so \
	$(plugin)/IBM1364.so \
	$(plugin)/IBM1371.so \
	$(plugin)/IBM1388.so \
	$(plugin)/IBM1390.so \
	$(plugin)/IBM1399.so \
	$(plugin)/IBM16804.so \
	$(plugin)/IBM256.so \
	$(plugin)/IBM273.so \
	$(plugin)/IBM274.so \
	$(plugin)/IBM275.so \
	$(plugin)/IBM277.so \
	$(plugin)/IBM278.so \
	$(plugin)/IBM280.so \
	$(plugin)/IBM281.so \
	$(plugin)/IBM284.so \
	$(plugin)/IBM285.so \
	$(plugin)/IBM290.so \
	$(plugin)/IBM297.so \
	$(plugin)/IBM420.so \
	$(plugin)/IBM423.so \
	$(plugin)/IBM424.so \
	$(plugin)/IBM437.so \
	$(plugin)/IBM4517.so \
	$(plugin)/IBM4899.so \
	$(plugin)/IBM4909.so \
	$(plugin)/IBM4971.so \
	$(plugin)/IBM500.so \
	$(plugin)/IBM5347.so \
	$(plugin)/IBM803.so \
	$(plugin)/IBM850.so \
	$(plugin)/IBM851.so \
	$(plugin)/IBM852.so \
	$(plugin)/IBM855.so \
	$(plugin)/IBM856.so \
	$(plugin)/IBM857.so \
	$(plugin)/IBM860.so \
	$(plugin)/IBM861.so \
	$(plugin)/IBM862.so \
	$(plugin)/IBM863.so \
	$(plugin)/IBM864.so \
	$(plugin)/IBM865.so \
	$(plugin)/IBM866NAV.so \
	$(plugin)/IBM866.so \
	$(plugin)/IBM868.so \
	$(plugin)/IBM869.so \
	$(plugin)/IBM870.so \
	$(plugin)/IBM871.so \
	$(plugin)/IBM874.so \
	$(plugin)/IBM875.so \
	$(plugin)/IBM880.so \
	$(plugin)/IBM891.so \
	$(plugin)/IBM901.so \
	$(plugin)/IBM902.so \
	$(plugin)/IBM9030.so \
	$(plugin)/IBM903.so \
	$(plugin)/IBM904.so \
	$(plugin)/IBM905.so \
	$(plugin)/IBM9066.so \
	$(plugin)/IBM918.so \
	$(plugin)/IBM921.so \
	$(plugin)/IBM922.so \
	$(plugin)/IBM930.so \
	$(plugin)/IBM932.so \
	$(plugin)/IBM933.so \
	$(plugin)/IBM935.so \
	$(plugin)/IBM937.so \
	$(plugin)/IBM939.so \
	$(plugin)/IBM943.so \
	$(plugin)/IBM9448.so \
	$(plugin)/IEC_P27-1.so \
	$(plugin)/INIS-8.so \
	$(plugin)/INIS-CYRILLIC.so \
	$(plugin)/INIS.so \
	$(plugin)/ISIRI-3342.so \
	$(plugin)/ISO_10367-BOX.so \
	$(plugin)/ISO_11548-1.so \
	$(plugin)/ISO-2022-CN-EXT.so \
	$(plugin)/ISO-2022-CN.so \
	$(plugin)/ISO-2022-JP-3.so \
	$(plugin)/ISO-2022-JP.so \
	$(plugin)/ISO-2022-KR.so \
	$(plugin)/ISO_2033.so \
	$(plugin)/ISO_5427-EXT.so \
	$(plugin)/ISO_5427.so \
	$(plugin)/ISO_5428.so \
	$(plugin)/ISO646.so \
	$(plugin)/ISO_6937-2.so \
	$(plugin)/ISO_6937.so \
	$(plugin)/ISO8859-10.so \
	$(plugin)/ISO8859-11.so \
	$(plugin)/ISO8859-13.so \
	$(plugin)/ISO8859-14.so \
	$(plugin)/ISO8859-15.so \
	$(plugin)/ISO8859-16.so \
	$(plugin)/ISO8859-1.so \
	$(plugin)/ISO8859-2.so \
	$(plugin)/ISO8859-3.so \
	$(plugin)/ISO8859-4.so \
	$(plugin)/ISO8859-5.so \
	$(plugin)/ISO8859-6.so \
	$(plugin)/ISO8859-7.so \
	$(plugin)/ISO8859-8.so \
	$(plugin)/ISO8859-9E.so \
	$(plugin)/ISO8859-9.so \
	$(plugin)/ISO-IR-197.so \
	$(plugin)/ISO-IR-209.so \
	$(plugin)/JOHAB.so \
	$(plugin)/KOI8-R.so \
	$(plugin)/KOI8-RU.so \
	$(plugin)/KOI-8.so \
	$(plugin)/KOI8-T.so \
	$(plugin)/KOI8-U.so \
	$(plugin)/LATIN-GREEK-1.so \
	$(plugin)/LATIN-GREEK.so \
	$(plugin)/libCNS.so \
	$(plugin)/libGB.so \
	$(plugin)/libISOIR165.so \
	$(plugin)/libJIS.so \
	$(plugin)/libJISX0213.so \
	$(plugin)/libKSC.so \
	$(plugin)/MAC-CENTRALEUROPE.so \
	$(plugin)/MACINTOSH.so \
	$(plugin)/MAC-IS.so \
	$(plugin)/MAC-SAMI.so \
	$(plugin)/MAC-UK.so \
	$(plugin)/MIK.so \
	$(plugin)/NATS-DANO.so \
	$(plugin)/NATS-SEFI.so \
	$(plugin)/PT154.so \
	$(plugin)/RK1048.so \
	$(plugin)/SAMI-WS2.so \
	$(plugin)/SHIFT_JISX0213.so \
	$(plugin)/SJIS.so \
	$(plugin)/T.61.so \
	$(plugin)/TCVN5712-1.so \
	$(plugin)/TIS-620.so \
	$(plugin)/TSCII.so \
	$(plugin)/UHC.so \
	$(plugin)/UNICODE.so \
	$(plugin)/UTF-16.so \
	$(plugin)/UTF-32.so \
	$(plugin)/UTF-7.so \
	$(plugin)/VISCII.so

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

