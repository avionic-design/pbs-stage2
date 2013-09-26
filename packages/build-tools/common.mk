prefix = $(objtree)/build-tools
env = env -i \
	PATH=$(prefix)/bin:$(PATH) \
	PKG_CONFIG_PATH=$(prefix)/lib/pkgconfig \
	LD_LIBRARY_PATH=$(prefix)/lib \
	LIBRARY_PATH=$(prefix)/lib \
	CPATH=$(prefix)/include

NUM_CPU = $(shell cat /proc/cpuinfo | grep '^processor' | wc -l)
ifeq ($(NUM_CPU),)
  NUM_CPU = 1
endif
export NUM_CPU

# .binary and .install targets are useless for build tools
$(pkgtree)/.binary: $(pkgtree)/.do-install
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(call cmd,stamp)
