SUBDIRS = \
	usr/lib \
	usr/bin

recurse = \
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done

all:
	$(call recurse)

install:
	$(call recurse)

clean:
	$(call recurse)

