PACKAGE = synergy
VERSION = 1.5.0
REVISION = r2278
RELEASE = Source

LOCATION = http://synergy-project.org/files/packages
TARBALLS = $(PACKAGE)-$(VERSION)-$(REVISION)-$(RELEASE).tar.gz

include packages/cmake.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(VERSION)-$(RELEASE)

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
	/usr/bin/synergyc \
	/usr/bin/synergyd \
	/usr/bin/synergys \
	/usr/bin/syntool
