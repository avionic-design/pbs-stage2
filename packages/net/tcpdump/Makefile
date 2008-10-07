PACKAGE = tcpdump
VERSION = 3.9.8

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--disable-smb

conf-vars += \
	ac_cv_linux_vers=2 \
	$(call set-args, CC CFLAGS LDFLAGS)

build-vars += \
	CFLAGS='$(CFLAGS) -include config.h -I.. -D_U_="__attribute__((unused))"' \
	LDFLAGS='$(LDFLAGS)'

package-clean:
	@:

