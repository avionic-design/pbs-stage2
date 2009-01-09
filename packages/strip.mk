strip-pkg := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.strip \
			package
export stripfiles

PHONY += package-strip
package-strip:
	$(Q)$(MAKE) $(strip-pkg)=$(package)

.PHONY: $(PHONY)

