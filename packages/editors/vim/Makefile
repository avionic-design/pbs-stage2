PACKAGE = vim
VERSION = 7.1

LOCATION = ftp://ftp.vim.org/pub/vim/unix
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = Vi IMproved - enhanced vi editor

##############################################################################

include packages/autotools.mk

pkgtree = $(buildtree)/vim71

conf-vars += \
	$(call set-args, STRIP)

