PACKAGE = libpcap
VERSION = 1.0.0

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--with-pcap=linux \
	--enable-ipv6 \
	--enable-shared

conf-vars += \
	ac_cv_linux_vers=2

package-clean:
	@:

