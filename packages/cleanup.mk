include $(srctree)/packages/prune.mk
include $(srctree)/packages/strip.mk

$(pkgtree)/.cleanup: $(pkgtree)/.prune $(pkgtree)/.strip
	$(call cmd,stamp)

.PHONY: $(PHONY)
