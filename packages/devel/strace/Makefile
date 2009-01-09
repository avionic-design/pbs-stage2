PACKAGE = strace
VERSION = 4.5.18

LOCATION = http://heanet.dl.sourceforge.net/sourceforge/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = a system call tracer

##############################################################################

include packages/autotools.mk

conf-args += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

stripfiles = \
	$(prefix)/bin/strace

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

package-clean:
	@:

