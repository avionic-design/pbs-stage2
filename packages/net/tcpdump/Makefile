PACKAGE = tcpdump
VERSION = 3.9.5

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--disable-smb

conf-vars += \
	ac_cv_linux_vers=2 \
	$(call set-args, CC CFLAGS LDFLAGS)

#BUILD_ARGS = \
#	CFLAGS='$(CFLAGS) -include config.h -I. -D_U_="__attribute__((unused))"' \
#	LDFLAGS='$(LDFLAGS) -ldl'

package-clean:
	@:

