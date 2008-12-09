prunefiles := $(patsubst %,prune-$(ROOTFS)%,$(prunefiles))

PHONY += $(prunefiles)
$(prunefiles): prune-%:
	@echo "  PRUNE     $(subst prune-$(ROOTFS),,$@)"
	@$(priv) rm -f $(subst prune-,,$@)

PHONY += _prune
_prune: $(prunefiles)
	@:

.PHONY: $(PHONY)

