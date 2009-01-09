PACKAGE = tcpdump
VERSION = 4.0.0

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--without-crypto \
	--enable-ipv6 \
	--disable-smb

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	td_cv_buggygetaddrinfo=no \
	ac_cv_linux_vers=2

prunefiles = \
	$(prefix)/sbin/tcpdump.4.0.0

stripfiles = \
	$(prefix)/sbin/tcpdump

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

package-clean:
	@:

