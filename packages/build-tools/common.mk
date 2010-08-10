prefix = $(objtree)/build-tools
env = env -i PATH=$(prefix)/bin:$(PATH)

# .binary and .install targets are useless for build tools
$(pkgtree)/.binary: $(pkgtree)/.do-install
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(call cmd,stamp)
