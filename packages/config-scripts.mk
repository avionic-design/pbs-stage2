config-scripts-pkg := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.config-scripts package
export config-scriptfiles

$(pkgtree)/.config-scripts: $(pkgtree)/.do-install
	$(Q)$(MAKE) --no-print-directory $(config-scripts-pkg)=$(obj)
	$(call cmd,stamp)

.PHONY: $(PHONY)
