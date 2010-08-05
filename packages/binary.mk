$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	$(Q)$(MAKE) --no-print-directory $(binary)=$(obj) build
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	$(Q)$(MAKE) --no-print-directory $(binary)=$(obj) rootfs=$(SYSROOT) extract
	$(call cmd,stamp)
