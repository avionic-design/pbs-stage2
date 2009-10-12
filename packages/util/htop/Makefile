PACKAGE = htop
VERSION = 0.8.3

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	ac_cv_file__proc_stat=yes \
	ac_cv_file__proc_meminfo=yes
