prefix = $(objtree)/build-tools

# .binary and .install targets are useless for build tools
$(pkgtree)/.binary: $(pkgtree)/.do-install
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(call cmd,stamp)
