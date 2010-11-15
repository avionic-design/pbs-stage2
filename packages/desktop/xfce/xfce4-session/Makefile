PACKAGE = xfce4-session
VERSION = 4.7.1

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

engine = $(prefix)/lib/xfce4/session/splash-engines
panel = $(prefix)/lib/xfce4/panel/plugins

prunefiles = \
	$(prefix)/lib/*.la \
	$(engine)/*.la \
	$(engine)/*.a \
	$(panel)/*.la

stripfiles = \
	$(prefix)/bin/xfce4-session \
	$(prefix)/bin/xfce4-session-logout \
	$(prefix)/bin/xfce4-session-settings \
	$(prefix)/bin/xfce4-tips \
	$(prefix)/lib/xfce4/session/xfsm-shutdown-helper \
	$(prefix)/lib/*.so.* \
	$(engine)/*.so \
	$(panel)/*.so
