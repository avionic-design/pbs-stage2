prune-pkg := -f $(if $(KBUILD_SRC), $(srctree)/)scripts/Makefile.prune \
			package
export prunefiles
export prunedirs

$(pkgtree)/.prune:
	$(Q)$(MAKE) $(prune-pkg)=$(package)
	$(call cmd,stamp)

.PHONY: $(PHONY)
