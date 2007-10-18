PACKAGE = Linux-PAM
VERSION = 0.99.9.0

LOCATION = http://www.kernel.org/pub/linux/libs/pam/pre/library
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/devel/autotools.mk
priv = sudo

conf-args += \
	--disable-rpath

conf-vars += \
	acl_cv_rpath=done

##
## FIXME: this is truly amazingly ugly, but seems the only way to get the
##        package to install correctly
##
package-pre-install:
	$(priv) ln -sf $(ROOTFS)/tools /tools

package-post-install:
	$(priv) rm /tools
##
## FIXME: end of ugly bug
##

package-clean:
	@:

