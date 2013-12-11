prune-pkg := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.prune package
export prunefiles
export prunedirs

$(pkgtree)/.prune: $(pkgtree)/.do-install
	$(Q)$(MAKE) --no-print-directory $(prune-pkg)=$(obj)
	$(call cmd,stamp)

.PHONY: $(PHONY)
