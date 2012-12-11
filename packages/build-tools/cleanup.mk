prune := -f $(if $(KBUILD_SRC),$(srctree)/)packages/build-tools/prune.mk obj

$(pkgtree)/.prune:
	$(Q)$(MAKE) $(prune)=$(obj)
	$(call cmd,stamp)

$(pkgtree)/.binary: $(pkgtree)/.prune
