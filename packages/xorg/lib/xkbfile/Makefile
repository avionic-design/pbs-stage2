PACKAGE = libxkbfile
VERSION = 1.0.5

include packages/xorg/lib/Makefile

package-pre-configure:
	chmod u+w $(pkgtree)/ltmain.sh
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

