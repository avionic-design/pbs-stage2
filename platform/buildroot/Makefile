ROOTFS = $(PLATFORM)/rootfs

platform-clean: __clean-dirs += $(ROOTFS)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),@:)

PHONY += FORCE
FORCE:
	@:

.PHONY: $(PHONY)

