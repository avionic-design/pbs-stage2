include packages/prune.mk
include packages/strip.mk

PHONY += package-cleanup
package-cleanup: package-prune package-strip
	@:

.PHONY: $(PHONY)

