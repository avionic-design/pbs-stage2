all: tvp5150-monit

clean:
	rm -f tvp5150-monit

tvp5150-monit: tvp5150-monit.c
	$(CC) $(CFLAGS) -o $@ $^
	$(STRIP) $@

