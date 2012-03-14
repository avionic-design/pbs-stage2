PACKAGE = libpcap
VERSION = 1.2.1

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-pcap=linux \
	--enable-ipv6 \
	--enable-shared

conf-vars += \
	ac_cv_linux_vers=2

stripfiles = \
	$(prefix)/lib/*.so.*
