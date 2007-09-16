PACKAGE = gtk+
VERSION = 2.10.13

LOCATION = ftp://ftp.gtk.org/pub/gtk/v2.10
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

conf-args += \
	--with-gdktarget=linux-fb \
	--enable-fbmanager

package-clean:
	@:

