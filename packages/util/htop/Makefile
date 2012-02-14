PACKAGE = htop
VERSION = 1.0

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--enable-native-affinity \
	--disable-unicode

conf-vars += \
	ac_cv_file__proc_stat=yes \
	ac_cv_file__proc_meminfo=yes \
	ac_cv_sched_setaffinity=yes

stripfiles = \
	$(prefix)/bin/htop
