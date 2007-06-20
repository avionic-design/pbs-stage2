#include <stdio.h>
#include <errno.h>
#include <abox.h>

static void usage(FILE *fp, const char *binary)
{
	fprintf(fp, "usage: %s DEVICE {get|set|clear} BIT...\n", binary);
	fprintf(fp, "   or: %s DEVICE power {on|off}\n", binary);
	fprintf(fp, "\n");
	fprintf(fp, "  DEVICE - the device to access\n");
	fprintf(fp, "  BIT... - one or more bits to get, set or clear\n");
	fprintf(fp, "\n");
	fprintf(fp, "In the first form, one or more given bits are queried, set or cleared.\n");
	fprintf(fp, "\n");
	fprintf(fp, "The second form is used to power the component attached to the I/O\n");
	fprintf(fp, "connector on or off.\n");
}

static int set_bit(int abio, int bit)
{
	int retval = abox_io_set_bit(abio, bit);
	if (retval < 0) {
		fprintf(stderr, "error setting bit %d\n", bit);
	}

	return retval;
}

static int clear_bit(int abio, int bit)
{
	int retval = abox_io_clear_bit(abio, bit);
	if (retval < 0) {
		fprintf(stderr, "error clearing bit %d\n", bit);
	}

	return retval;
}

static int get_bit(int abio, int bit)
{
	int retval = abox_io_get_bit(abio, bit);
	if (retval < 0) {
		fprintf(stderr, "error getting bit %d\n", bit);
	} else {
		printf("bit %d: %d\n", bit, retval);
	}

	return retval;
}

int main(int argc, char **argv)
{
	int (*cmd)(int, int) = NULL;
	int abio = -1, retval = 0, i;
	char *command = NULL;

	if (argc < 4) {
		usage(stderr, argv[0]);
		return 1;
	}

	command = argv[2];
	if (strcmp(command, "set") == 0) {
		cmd = set_bit;
	} else if (strcmp(command, "clear") == 0) {
		cmd = clear_bit;
	} else if (strcmp(command, "get") == 0) {
		cmd = get_bit;
	} else {
		fprintf(stderr, "invalid command: %s\n", command);
		return 1;
	}

	abio = abox_io_open(argv[1], 0, 0);
	if (abio < 0) {
		fprintf(stderr, "%s: %s\n", argv[1], strerror(errno));
		return 1;
	}

	for (i = 3; i < argc; i++) {
		int bit = atoi(argv[i]);
		int err = cmd(abio, bit);
		if (err < 0) {
			fprintf(stderr, "an error occurred: %d\n", err);
			retval = 1;
			break;
		}
	}

	abox_io_close(abio);
	return retval;
}

