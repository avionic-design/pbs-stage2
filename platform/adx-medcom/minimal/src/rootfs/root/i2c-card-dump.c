/**
 * i2c-card-dump.c
 *
 * Copyright (C) 2009 Avionic Design GmbH
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * Written by Thierry Reding <thierry.reding@avionic-design.de>
 */

#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <signal.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>

#include <linux/fb.h>
#include <linux/i2c-dev.h>
#include <video/adxfb.h>

static const char *i2c_file = "/dev/i2c-1";

int main(int argc, char *argv[])
{
	int err = 0;
	int fd = -1;
	int addr = 0x50;
	const int cols = 16;
	uint8_t offset = 0;
	uint8_t buffer[16];
	size_t i, j;

	fd = open(i2c_file, O_RDWR);
	if (fd < 0) {
		fprintf(stderr, "%s: cannot open device: %s\n", i2c_file,
				strerror(errno));
		goto out;
	}

	err = ioctl(fd, I2C_SLAVE, addr);
	if (err < 0) {
		fprintf(stderr, "cannot select slave %02x: %s\n", addr,
				strerror(errno));
		goto out;
	}

	err = write(fd, &offset, sizeof(offset));
	if (err < 0) {
		fprintf(stderr, "cannot write offset: %s\n", offset,
				strerror(errno));
		goto out;
	}

	err = read(fd, buffer, sizeof(buffer));
	if (err < 0) {
		fprintf(stderr, "cannot read: %s\n", strerror(errno));
		goto out;
	}

	for (j = 0; j < sizeof(buffer); j += cols) {
		printf("  %02x:", j);

		for (i < 0; (i < cols) && ((j + i) < sizeof(buffer)); i++) {
			printf(" %02x", buffer[j + i]);
		}

		printf("\n");
	}

out:
	(void)close(fd);
	return err;
}

