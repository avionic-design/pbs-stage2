# add rootfs prefix and expand wildcards
prunedirs  := $(wildcard $(patsubst %,$(ROOTFS)%,$(prunedirs)))
prunefiles := $(wildcard $(patsubst %,$(ROOTFS)%,$(prunefiles)))
# add the prune- prefix
prunedirs  := $(patsubst %,prune-%,$(prunedirs))
prunefiles := $(patsubst %,prune-%,$(prunefiles))

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

