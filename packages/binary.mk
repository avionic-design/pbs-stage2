$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-s $(DESTDIR) -b $(objtree)/binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-t $(TARGET) -v $(VERSION) -b $(objtree)/binary
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-t $(TARGET) -v $(VERSION) -r $(SYSROOT) \
			-b $(objtree)/binary
	$(call cmd,stamp)
