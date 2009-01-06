prunedirs  := $(patsubst %,prune-$(ROOTFS)%,$(prunedirs))
prunefiles := $(patsubst %,prune-$(ROOTFS)%,$(prunefiles))

PHONY += $(prunedirs)
$(prunedirs): prune-%:
	@echo "  PRUNE     $(subst prune-$(ROOTFS),,$@)"
	@$(priv) rm -rf $(subst prune-,,$@)

PHONY += $(prunefiles)
$(prunefiles): prune-%:
	@echo "  PRUNE     $(subst prune-$(ROOTFS),,$@)"
	@$(priv) rm -f $(subst prune-,,$@)

PHONY += _prune
_prune: $(prunedirs) $(prunefiles)
	@:

.PHONY: $(PHONY)

