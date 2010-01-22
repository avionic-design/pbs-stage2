VERSION = 0.0.0

include packages/common.mk

scripts = \
	/init

files = \
	/etc/fstab \
	/etc/group \
	/etc/mdev.conf \
	/etc/passwd \
	/etc/shadow \
	/etc/sysctl.conf \
	/lib/lsb/init-functions

scripts := $(addprefix $(DESTDIR),$(scripts))
files := $(addprefix $(DESTDIR),$(files))

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(scripts): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install_bin)

$(files): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install)

$(pkgtree)/.do-install: $(pkgtree)/.build $(scripts) $(files)
	$(call cmd,stamp)

include packages/binary.mk
