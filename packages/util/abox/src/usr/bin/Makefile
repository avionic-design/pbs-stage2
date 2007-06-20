all: abioctl

abioctl_CFLAGS = -I../include
abioctl_LIBS = -L../lib -labox

%: %.c
	$(CC) $(CFLAGS) $($@_CFLAGS) -o $@ $< $(LDFLAGS) $($@_LIBS)

install:
	install abioctl $(DESTDIR)/usr/bin

clean:
	rm -f abioctl

