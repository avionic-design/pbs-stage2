CONFIG_SHELL ?= /bin/sh

HOSTCC = gcc

host-progs-y = conf mconf kxgettext kdeps

all: $(host-progs-y)

host-cflags   = $(shell $(CONFIG_SHELL) lxdialog/check-lxdialog.sh -ccflags)
lxdialog-libs = $(shell $(CONFIG_SHELL) lxdialog/check-lxdialog.sh -ldflags $(HOSTCC))

lxdialog-objs-y = \
	lxdialog/checklist.o \
	lxdialog/inputbox.o \
	lxdialog/menubox.o \
	lxdialog/textbox.o \
	lxdialog/util.o \
	lxdialog/yesno.o

conf-objs-y = \
	conf.o \
	zconf.tab.o

mconf-objs-y = \
	$(lxdialog-objs-y) \
	mconf.o \
	zconf.tab.o

kxgettext-objs-y = \
	kxgettext.o \
	zconf.tab.o

kdeps-objs-y = \
	kdeps.o \
	zconf.tab.o

zconf.tab.o: lex.zconf.c zconf.hash.c

zconf.tab.c: zconf.y confdata.c
lex.zconf.c: zconf.l
zconf.hash.c: zconf.gperf

%.tab.c: %.y
	bison -l -b $* -p $(notdir $*) $<

lex.%.c: %.l
	flex -L -P$(notdir $*) -o $@ $<

%.hash.c: %.gperf
	gperf < $< > $@

conf: $(conf-objs-y)
	$(HOSTCC) -o $@ $^

mconf: $(mconf-objs-y)
	$(HOSTCC) -o $@ $^ $(lxdialog-libs)

kxgettext: $(kxgettext-objs-y)
	$(HOSTCC) -o $@ $^

kdeps: $(kdeps-objs-y)
	$(HOSTCC) -o $@ $^

util.o: lkc_defs.h

lkc_defs.h: lkc_proto.h
	sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'

%.o: %.c
	$(HOSTCC) $(host-cflags) -o $@ -c $<

gen-files = lkc_defs.h

clean:
	rm -rf $(gen-files)
	rm -rf $(conf-objs-y)
	rm -rf $(mconf-objs-y)
	rm -rf $(kxgettext-objs-y)
	rm -rf $(kdeps-objs-y)

