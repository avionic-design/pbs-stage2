include packages/prune.mk
include packages/strip.mk

PHONY += _cleanup
_cleanup: _prune _strip
	@:

.PHONY: $(PHONY)

