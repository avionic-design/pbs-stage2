PACKAGE = libXdmcp
VERSION = 1.0.2

include packages/xorg/lib/Makefile

prunefiles = \
	$(prefix)/lib/libXdmcp.la

stripfiles = \
	$(prefix)/lib/libXdmcp.so.6.0.0

include packages/cleanup.mk

package-post-install: _cleanup
	@:

