PACKAGE = nosy
VERSION = 0.0.1

dirs = \
	/etc

files = \
	/etc/inittab \
	/etc/mdev.conf

scripts = \
	/init

include platforms/common.mk

quiet_cmd_edit = SED     $@
      cmd_edit = $(SED) 's|@VERSION@|$(VERSION)|' $< > $@

$(DESTDIR)/etc/os-release: $(obj)/src/etc/os-release.in $(obj)/Makefile
	$(call cmd,edit)

$(pkgtree)/.do-install: $(DESTDIR)/etc/os-release
