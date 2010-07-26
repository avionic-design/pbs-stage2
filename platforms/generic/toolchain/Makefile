PACKAGE = generic-toolchain
VERSION = 0.0.0

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.do-install
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(call cmd,stamp)
