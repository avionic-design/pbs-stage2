strip-pkg := -f $(if $(KBUILD_SRC), $(srctree)/)scripts/Makefile.strip \
			package
export stripfiles

$(pkgtree)/.strip:
	$(Q)$(MAKE) $(strip-pkg)=$(package)
	$(call cmd,stamp)

.PHONY: $(PHONY)

