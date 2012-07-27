include packages/kernel/kmod/Makefile.location
include packages/autotools.mk

dirs = \
	/bin \
	/sbin \
	$(prefix)/bin \
	$(prefix)/sbin

links = \
	$(prefix)/bin/lsmod \
	$(prefix)/sbin/depmod \
	$(prefix)/sbin/insmod \
	$(prefix)/sbin/modinfo \
	$(prefix)/sbin/modprobe \
	$(prefix)/sbin/rmmod \
	/bin/lsmod \
	/sbin/depmod \
	/sbin/insmod \
	/sbin/modinfo \
	/sbin/modprobe \
	/sbin/rmmod

dirs := $(addprefix $(DESTDIR),$(dirs))
links := $(addprefix $(DESTDIR),$(links))

$(dirs):
	$(call cmd,mkdir_p)

$(links): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install_link)

$(pkgtree)/.prune: $(dirs) $(links)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/kmod \
	$(prefix)/lib/*.so.*
