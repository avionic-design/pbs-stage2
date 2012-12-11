PHONY += all
all: prune
	@:

include scripts/Kbuild.include
include $(obj)/Makefile

prunefiles := $(addprefix prune-,$(wildcard $(prunefiles)))

quiet_cmd_prune = PRUNE   $*
      cmd_prune = rm -f $*

PHONY += $(prunefiles)
$(prunefiles): prune-%:
	$(call cmd,prune)

PHONY += prune
prune: $(prunefiles)

.PHONY: $(PHONY)
