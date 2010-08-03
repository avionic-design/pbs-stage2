ARCH := $(subst $(quote),,$(CONFIG_ARCH))
CPU := $(subst $(quote),,$(CONFIG_CPU))
LIBC := $(subst $(quote),,$(CONFIG_LIBC))
ABI := $(subst $(quote),,$(CONFIG_ABI))

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR) \
			-b $(objtree)/binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) \
			-b $(objtree)/binary
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(SYSROOT) \
			-b $(objtree)/binary
	$(call cmd,stamp)
