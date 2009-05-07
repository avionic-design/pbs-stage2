prune-pkg := -f $(if $(KBUILD_SRC), $(srctree)/)scripts/Makefile.prune \
			package
export prunefiles
export prunedirs

PHONY += package-prune
package-prune:
	$(Q)$(MAKE) $(prune-pkg)=$(package)

.PHONY: $(PHONY)

