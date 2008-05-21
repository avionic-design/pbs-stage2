PACKAGE = binutils
VERSION = 2.18

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/bootstrap/autotools.mk

ifneq ($(HOST),$(TARGET))
  conf-args += \
	--target=$(TARGET)
endif

conf-args += \
	--with-lib-path=$(devel-prefix)/lib \
	--program-prefix=$(TARGET)- \
	--disable-nls

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args =
package-install:
	cd $(pkgtree) && $(env) $(priv) $(MAKE) $(install-args) install

package-clean:
	@:

