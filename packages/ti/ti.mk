# Common definitions for the PBS makefile

include packages/common.mk
include packages/ti/make-args.mk

pkgbuildtree   := $(pkgtree)/$(or $(TI_PACKAGE),$(PACKAGE))_$(or $(TI_VERSION),$(VERSION))
makefile-build := $(srctree)/packages/ti/$(PACKAGE)/Makefile.build

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(makefile-build) $(pkgtree)/.patch
	cp $< $(pkgbuildtree)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	mkdir -p $(pkgbuildtree)/build && \
		cd $(pkgbuildtree)/build && \
			$(env) $(MAKE) -j $(NUM_CPU) -f ../Makefile.build $(make-args)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	mkdir -p $(pkgbuildtree)/build && \
		cd $(pkgbuildtree)/build && \
			$(env) $(MAKE) -j $(NUM_CPU) -f ../Makefile.build $(make-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
