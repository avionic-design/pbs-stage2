ifndef GIT_URL
$(error GIT_URL is undefined)
endif

conf-cmd = ../autogen.sh

include packages/autotools.mk
