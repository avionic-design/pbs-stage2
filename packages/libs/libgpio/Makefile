PACKAGE = libgpio
VERSION = git

LOCATION = http://www.avionic-design.de/pub/$(PACKAGE)
TARBALLS =

GITTREE = $(srctree)/../avionic-design/libgpio.git

include packages/autotools-git.mk

prunefiles = \
	$(prefix)/lib/libgpio.la

stripfiles = \
	$(prefix)/bin/gpioctl \
	$(prefix)/bin/gpiospy \
	$(prefix)/lib/libgpio.so.0.0.0
