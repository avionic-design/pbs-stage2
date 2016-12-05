include $(srctree)/packages/config-scripts.mk
include $(srctree)/packages/prune.mk
include $(srctree)/packages/strip.mk

$(pkgtree)/.cleanup: $(pkgtree)/.config-scripts $(pkgtree)/.prune $(pkgtree)/.strip
	$(call cmd,stamp)

.PHONY: $(PHONY)
