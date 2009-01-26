PACKAGE = gcc

ifeq ($(GCC_VERSION),snapshot)
  VERSION  = $(GCC_SNAPSHOT)
  CONFIG   = snapshot
  LOCATION = ftp://gcc.gnu.org/pub/$(PACKAGE)/snapshots/$(VERSION)
else
  VERSION  = $(GCC_VERSION)
  CONFIG   = $(VERSION)
  LOCATION = ftp://ftp.gwdg.de/pub/misc/gcc/releases/$(PACKAGE)-$(VERSION)
endif

TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

##############################################################################

patchdir = $(srctree)/packages/$(package)/$(VERSION)/patches/$(LIBC)/$(FLOAT)

include packages/toolchain/common.mk
include packages/toolchain/gcc-core/Makefile.$(CONFIG)

package-clean:
	@:

