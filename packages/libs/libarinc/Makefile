PACKAGE = libarinc
VERSION = git

LOCATION = http://www.avionic-design.de/pub/$(PACKAGE)
TARBALLS =

GITTREE = $(srctree)/../avionic-design/libarinc.git

include packages/autotools-git.mk
NUM_CPU = 1

prunefiles = \
	$(prefix)/lib/libarinc.la

stripfiles = \
	$(prefix)/bin/arincdump \
	$(prefix)/bin/arincsend \
	$(prefix)/lib/libarinc.so.0.0.0
