all: libabox.so.0 libabox.so

CFLAGS += -fPIC

libabox.so.0: abox-io.o
	$(CC) $(CFLAGS) -shared -o $@ $^ $(LDFLAGS)

libabox.so: libabox.so.0
	ln -sf $< $@

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $< $($@_LIBS)

install:
	install libabox.so.0 $(DESTDIR)/usr/lib
	install libabox.so $(DESTDIR)/usr/lib

clean:
	rm -f abox-io.o libabox.so.0 libabox.so

