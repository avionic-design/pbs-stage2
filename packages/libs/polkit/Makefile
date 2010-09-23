PACKAGE = polkit
VERSION = 0.99

LOCATION = http://hal.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/polkit-1 \
	--disable-introspection \
	--with-os-type=unknown

prunefiles = \
	$(prefix)/lib/polkit-1/extensions/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/pkaction \
	$(prefix)/bin/pkcheck \
	$(prefix)/bin/pkexec \
	$(prefix)/lib/polkit-1/extensions/*.so \
	$(prefix)/lib/polkit-1/polkit-agent-helper-1 \
	$(prefix)/lib/polkit-1/polkitd \
	$(prefix)/lib/*.so.*
