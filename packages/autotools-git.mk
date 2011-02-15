ifndef GIT_URL
$(error GIT_URL is undefined)
endif

conf-cmd = $(pkgbuildtree)/autogen.sh

include packages/autotools.mk
