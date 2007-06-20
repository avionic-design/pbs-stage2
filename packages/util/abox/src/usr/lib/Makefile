ifdef PLATFORM
  include $(PLATFORM)/../../../scripts/pbuild.mk
endif

PHONY += all
all: libabox.so.0 libabox.so

CFLAGS += -fPIC

quiet_cmd_ld_so = LD        $@
      cmd_ld_so = $(CC) $(CFLAGS) -shared -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS)

libabox.so.0: EXTRA_LDFLAGS = -Wl,-soname,$@
libabox.so.0: abox-io.o
	$(call cmd,ld_so)

quiet_cmd_ln_sf = LN        $@
      cmd_ln_sf = ln -sf $< $@

libabox.so: libabox.so.0
	$(call cmd,ln_sf)

quiet_cmd_cc_o_c = CC        $@
      cmd_cc_o_c = $(CC) $(CFLAGS) -o $@ -c $<

%.o: %.c
	$(call cmd,cc_o_c)

quiet_cmd_install = INSTALL   $@
      cmd_install = cp $< $@

files-y    := libabox.so.0 libabox.so
dstfiles-y := $(patsubst %,$(DESTDIR)/usr/lib/%,$(files-y))

$(dstfiles-y): $(DESTDIR)/usr/lib/%: %
	$(call cmd,install)

PHONY += install
install: $(dstfiles-y)

PHONY += clean
clean: __clean-files = abox-io.o libabox.so.0 libabox.so
clean:
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)

