PACKAGE = ffmpeg-csc
VERSION = git-20110110

GIT_URL      = git://git.adnet.avionic-design.de/multimedia/ffmpeg.git
GIT_CHECKOUT = $(CONFIG_FFMPEG_CSC_BRANCH)

include packages/autotools.mk

# sws is disabled because it is in a separate repository
conf-args = \
        --prefix=$(prefix) \
        --cross-prefix=$(TARGET)- \
        --enable-cross-compile \
        --target-os=$(CONFIG_OS) \
        --arch=$(CONFIG_ARCH) \
        --sysroot=$(SYSROOT) \
        --disable-swscale \
        $(platform-conf-args)

conf-vars = \
        $(platform-conf-vars)

build-args = \
	V=$(V)
