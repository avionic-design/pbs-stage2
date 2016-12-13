PACKAGE = synergy
VERSION = 1.5.0

LOCATION = https://github.com/symless/$(PACKAGE)/archive
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/cmake.mk

zipfiles := ext/cryptopp562.zip ext/gmock-1.6.0.zip ext/gtest-1.6.0.zip

unzip := $(addprefix $(pkgtree)/.unzip-,$(zipfiles))

quiet_cmd_unzip_extra = UNZIP   $<
      cmd_unzip_extra = mkdir -p $(pkgbuildtree)/$* && unzip -q -d $(pkgbuildtree)/$* $<

$(pkgtree)/.unzip-%.zip: $(pkgbuildtree)/%.zip
	$(call cmd,unzip_extra)
	$(call cmd,stamp)

$(pkgtree)/.setup: $(unzip)

cmake-args += \
	-DCMAKE_BUILD_TYPE=Debug

stripfiles = \
	$(prefix)/bin/synergyc \
	$(prefix)/bin/synergyd \
	$(prefix)/bin/synergys \
	$(prefix)/bin/syntool
