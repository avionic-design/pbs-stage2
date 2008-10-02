prunefiles := $(patsubst %,prune-$(ROOTFS)%,$(prunefiles))

PHONY += $(prunefiles)
$(prunefiles): prune-%: %
	@echo "  PRUNE     $(subst $(ROOTFS),,$<)"
	@$(priv) rm $<

PHONY += _prune
_prune: $(prunefiles)
	@:

.PHONY: $(PHONY)

