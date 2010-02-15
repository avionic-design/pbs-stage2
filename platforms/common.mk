include packages/common.mk

dirs := $(addprefix $(DESTDIR),$(dirs))
scripts := $(addprefix $(DESTDIR),$(scripts))
files := $(addprefix $(DESTDIR),$(files))
links := $(addprefix $(DESTDIR),$(links))

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(files): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install)

quiet_cmd_priv_mkdir_p = MKDIR   $*
      cmd_priv_mkdir_p = $(priv) mkdir -p $@

$(dirs): $(DESTDIR)%:
	$(call cmd,priv_mkdir_p)

$(scripts): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install_bin)

$(links): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install_link)

$(pkgtree)/.do-install: $(pkgtree)/.build $(dirs) $(scripts) $(files) $(links)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
