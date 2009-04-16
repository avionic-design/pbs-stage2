PACKAGE = libXau
VERSION = 1.0.4

include packages/xorg/lib/common.mk

prunefiles = \
	$(prefix)/lib/libXau.la

stripfiles = \
	$(prefix)/lib/libXau.so.6.0.0

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

