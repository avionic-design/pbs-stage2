include scripts/Kbuild.include

strip-pkg := -f $(if $(KBUILD_SRC), $(srctree)/)scripts/Makefile.strip \
			package
export stripfiles

$(pkgtree)/.strip:
	$(Q)$(MAKE) $(strip-pkg)=$(obj)
	$(call cmd,stamp)

.PHONY: $(PHONY)
