PACKAGE = libsoup
VERSION = git

GITTREE = $(srctree)/../misc/libsoup.git

include packages/autotools-git.mk

conf-args += \
	--without-gnome

prunefiles = \
	$(prefix)/lib/libsoup-2.4.la

stripfiles = \
	$(prefix)/lib/libsoup-2.4.so.1.2.0
