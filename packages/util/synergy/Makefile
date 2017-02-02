PACKAGE = synergy
VERSION = 1.8.7

LOCATION = https://github.com/symless/$(PACKAGE)/archive
TARBALLS = v$(VERSION)-stable.tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)-stable

include packages/cmake.mk

zipfiles := ext/gmock-1.6.0.zip ext/gtest-1.6.0.zip

unzip := $(addprefix $(pkgtree)/.unzip-,$(zipfiles))

quiet_cmd_unzip_extra = UNZIP   $<
      cmd_unzip_extra = mkdir -p $(pkgbuildtree)/$* && unzip -q -d $(pkgbuildtree)/$* $<

$(pkgtree)/.unzip-%.zip: $(pkgbuildtree)/%.zip
	$(call cmd,unzip_extra)
	$(call cmd,stamp)

$(pkgtree)/.setup: $(unzip)

install-cmd = \
	@mkdir -p $(DESTDIR)$(prefix)/bin ; \
	cd $(pkgbuildtree)/bin && \
		$(INSTALL) -m 644 -t $(DESTDIR)$(prefix)/bin *

cmake-args += \
	-DCMAKE_BUILD_TYPE=Release

stripfiles = \
	$(prefix)/bin/synergyc \
	$(prefix)/bin/synergyd \
	$(prefix)/bin/synergys \
	$(prefix)/bin/syntool
