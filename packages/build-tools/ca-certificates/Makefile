include packages/net/ca-certificates/Makefile.location
include packages/build-tools/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)

DESTDIR = $(prefix)
CERTSDIR = share/$(PACKAGE)

$(pkgtree)/.build: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) all
	$(call cmd,stamp)

install-vars = \
	DESTDIR=$(DESTDIR) \
	CERTSDIR=$(CERTSDIR)

cert-args = \
	--certsconf $(prefix)/etc/ca-certificates.conf \
	--certsdir  $(prefix)/share/ca-certificates \
	--localcertsdir $(prefix)/local/share/ca-certificates \
	--certbundle ca-certificates.crt \
	--etccertsdir $(prefix)/ssl/certs \
	--hooksdir $(prefix)/etc/ca-certificates/update.d \
	-d

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		mkdir -p $(DESTDIR)/$(CERTSDIR) && \
		$(env) $(MAKE) $(install-vars) install
	touch $(prefix)/etc/ca-certificates.conf && \
		$(env) update-ca-certificates $(cert-args)
	$(call cmd,stamp)
