PACKAGE = sudo
VERSION = 1.6.9p6

LOCATION = ftp://ftp.sudo.ws/pub/sudo
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/buildroot/devel/autotools.mk

conf-args += \
	--without-pam

conf-vars += \
	sudo_cv_uid_t_len=10

package-clean:
	@:

