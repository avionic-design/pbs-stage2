PACKAGE = rsyslog
VERSION = 5.5.1

LOCATION = http://download.rsyslog.com/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

plugin = $(prefix)/lib/rsyslog

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so \
	$(prefix)/sbin/rsyslogd
