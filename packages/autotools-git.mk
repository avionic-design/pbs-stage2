ifndef GIT_URL
$(error GIT_URL is undefined)
endif

conf-cmd = $(pkgtree)/$(PACKAGE).git/autogen.sh

include packages/autotools.mk
