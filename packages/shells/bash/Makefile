PACKAGE = bash
VERSION = 4.2

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--bindir=/bin

ifeq ($(ARCH),blackfin)
conf-args += \
	--with-bash-malloc=no
endif

conf-vars += \
	bash_cv_job_control_missing=present

stripfiles = \
	/bin/bash
