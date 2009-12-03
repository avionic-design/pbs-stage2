PACKAGE = libsh
VERSION = git

LOCATION = http://www.avionic-design.de/pub/$(PACKAGE)
TARBALLS =

GITTREE = $(srctree)/../avionic-design/libsh.git

include packages/autotools-git.mk

prunefiles = \
	$(prefix)/lib/libsh.la

stripfiles = \
	$(prefix)/lib/libsh.so.0.0.0
