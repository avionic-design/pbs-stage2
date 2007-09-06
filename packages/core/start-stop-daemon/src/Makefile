CC      = $(CROSS_COMPILE)gcc
LD      = $(CC)
INSTALL = install
RM      = rm -f

all: start-stop-daemon

install:
	$(INSTALL) start-stop-daemon $(DESTDIR)/sbin

clean:
	echo $(RM) -r start-stop-daemon *.o

%: %.o
	$(CC) -o $@ $< $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

