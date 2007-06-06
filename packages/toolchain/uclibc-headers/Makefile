PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

env = PATH=/usr/bin:/bin:$(PLATFORM)/usr/bin

package-configure:
	cp conf/$(PACKAGE_FULLNAME).config $(pkgtree)/.config
	cd $(pkgtree) && $(MAKE) MAKEFLAGS= oldconfig

package-build:
	# nothing to see here, move along
	#cd $(pkgtree) && $(MAKE) PREFIX=$(PLATFORM) RUNTIME_PREFIX=/ DEVEL_PREFIX=/ headers

package-install:
	cd $(pkgtree) && $(MAKE) PREFIX=$(PLATFORM) RUNTIME_PREFIX=/ DEVEL_PREFIX=/usr/ install_dev


