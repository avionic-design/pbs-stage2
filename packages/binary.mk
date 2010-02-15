ARCH := $(shell echo $(CONFIG_ARCH))
CPU := $(shell echo $(CONFIG_CPU))
LIBC := $(shell echo $(CONFIG_LIBC))
ABI := $(shell echo $(CONFIG_ABI))

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR) -b $(objtree)/binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -b $(objtree)/binary
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(ROOTFS) -b $(objtree)/binary
	$(call cmd,stamp)
