PACKAGE = module-init-tools
VERSION = 3.2

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/module-init-tools
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

conf-args += \
	--sbindir=/sbin

package-pre-configure:
	cp support/config.{guess,sub} $(pkgtree)

package-clean:
	@:

