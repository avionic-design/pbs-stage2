include packages/prune.mk
include packages/strip.mk

$(pkgtree)/.cleanup: $(pkgtree)/.prune $(pkgtree)/.strip
	$(call cmd,stamp)

.PHONY: $(PHONY)

