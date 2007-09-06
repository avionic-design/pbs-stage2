PACKAGE = coreutils
VERSION = 6.9

LOCATION = http://ftp.gnu.org/gnu/coreutils
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = the GNU core utilities

##############################################################################

include packages/buildroot/devel/autotools.mk

# We override the PERL environment variable here. The build system will
# try to run the built programs through a perl script otherwise, but since
# we're cross-compiling, that just won't work.
conf-vars += \
	PERL=/br0ken/perl

#ifneq ($(LIBC),gnu)
#conf-vars += \
#	fu_cv_sys_stat_statvfs=yes
#endif

package-clean:
	@:

