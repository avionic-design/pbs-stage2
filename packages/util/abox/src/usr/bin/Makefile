ifdef PLATFORM
  include $(PLATFORM)/../../../scripts/pbuild.mk
endif

PHONY += all
all: abioctl

abioctl_CFLAGS = -I../include
abioctl_LIBS = -L../lib -labox

quiet_cmd_ld = LD        $@
      cmd_ld = $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS)

abioctl: EXTRA_CFLAGS  = -I../include
abioctl: EXTRA_LDFLAGS = -L../lib -labox
abioctl: abioctl.c
	$(call cmd,ld)

quiet_cmd_install = INSTALL   $@
      cmd_install = cp $< $@

files-y    := abioctl
dstfiles-y := $(patsubst %,$(DESTDIR)/usr/bin/%,$(files-y))

$(dstfiles-y): $(DESTDIR)/usr/bin/%: %
	$(call cmd,install)

PHONY += install
install: $(dstfiles-y)

PHONY += clean
clean: __clean-files = abioctl
clean:
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)

