PACKAGE = strace
VERSION = 4.5.15

LOCATION = http://heanet.dl.sourceforge.net/sourceforge/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = a system call tracer

##############################################################################

include packages/autotools.mk

conf-args += \
	$(call set-args, CC CFLAGS LDFLAGS)

package-clean:
	@:

