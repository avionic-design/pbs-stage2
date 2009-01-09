# add the strip- and rootfs prefixes
stripfiles := $(patsubst %,strip-$(ROOTFS)%,$(stripfiles))

PHONY += $(stripfiles)
$(stripfiles): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

PHONY += _strip
_strip: $(stripfiles)
	@:

.PHONY: $(PHONY)

