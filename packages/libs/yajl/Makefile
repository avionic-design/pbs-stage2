PACKAGE = yajl
VERSION = 2.0.4
LICENSE = ISC

LOCATION = https://github.com/lloyd/$(PACKAGE)/archive
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/cmake.mk

cmake-args += \
	-DshareDir=$(prefix)/lib/pkgconfig

stripfiles = \
	$(prefix)/bin/json_reformat \
	$(prefix)/bin/json_verify \
	$(prefix)/lib/*.so.*
