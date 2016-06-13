include packages/autotools-base.mk

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
			$(env) $(conf-cmd) $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-target ?= install

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgtree)/build/obj-$(HOST_GNU_TYPE) && \
		$(env) $(priv) $(MAKE) $(install-args) $(install-target)
	$(call cmd,stamp)

# Rule to automatically run reconf if configure doesn't exists
.SECONDEXPANSION:
$(pkgtree)/.configure: $$(conf-cmd)

# Build rule for the default $(conf-cmd). We can't use the
# .autoreconfigure rule, otherwise reconf is always called because
# of the missing .autoreconfigure stamp file
$(pkgbuildtree)/configure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install $(ACLOCAL_FLAGS)
