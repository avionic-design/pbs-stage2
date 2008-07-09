/**
 * tvp5150-monit.c
 *
 * Copyright (C) 2008 Avionic Design GmbH
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

enum tvp_mode {
	MODE_NONE,
	MODE_PAL,
	MODE_NTSC
};

static const char *daemon_name = "tvp5150-monit";
static const char *i2c_file = "/dev/i2c-0";
static const char *fb_file = "/dev/fb0";
static int done = 0;

static void signal_handler(int signum)
{
	switch (signum) {
		case SIGTERM:
			done = 1;
			break;

		default:
			break;
	}
}

static void usage(FILE *fp, const char *program)
{
	fprintf(fp, "usage: %s device\n", program);
}

static FILE *lock(const char *name)
{
	char lockfile[PATH_MAX];
	FILE *fp = NULL;
	pid_t pid;
	int len;

	snprintf(lockfile, sizeof(lockfile), "/var/lock/%s.lock", name);

	fp = fopen(lockfile, "r");
	if (fp) {
		len = fscanf(fp, "%d", &pid);
		fclose(fp);

		if ((len == EOF) || (len == 0) || (kill(pid, 0) == -1)) {
			syslog(LOG_INFO, "removing stale lockfile\n");
			if (unlink(lockfile) < 0) {
				if (truncate(lockfile, 0)) {
					syslog(LOG_ERR, "%s: cannot write "
							"lockfile: %s",
							strerror(errno));
					return NULL;
				}
			}
		} else {
			syslog(LOG_INFO, "%s daemon already running\n", name);
			return NULL;
		}
	}

	return fopen(lockfile, "w");
}

static void unlock(const char *name)
{
	char lockfile[PATH_MAX];
	snprintf(lockfile, sizeof(lockfile), "/var/lock/%s.lock", name);
	unlink(lockfile);
}

static int daemonize(const char *name)
{
	pid_t pid, sid;
	FILE *fp;
	int err;

	fp = lock(name);
	if (!fp)
		return -EBUSY;

	pid = fork();
	if (pid < 0) {
		syslog(LOG_ERR, "cannot fork parent process: %s",
				strerror(errno));
		fclose(fp);
		return -EFAULT;
	}

	if (pid > 0)
		exit(EXIT_SUCCESS);

	fprintf(fp, "%ld", (long)getpid());
	fclose(fp);

	umask(0);

	openlog(name, LOG_PID, LOG_LOCAL0);

	signal(SIGTERM, signal_handler);

	sid = setsid();
	if (sid < 0) {
		syslog(LOG_ERR, "cannot create session ID: %s",
				strerror(errno));
		return -EFAULT;
	}

	if (chdir("/") < 0) {
		syslog(LOG_ERR, "cannot change directory: %s",
				strerror(errno));
		return -EFAULT;
	}

	close(STDIN_FILENO);
	close(STDOUT_FILENO);
	close(STDERR_FILENO);

	return 0;
}

static int tvp5150_read(int fd, uint8_t reg, uint8_t *val)
{
	int err = 0;

	err = write(fd, &reg, sizeof(reg));
	if (err < 0) {
		syslog(LOG_ERR, "%02x: failed to send command: %s",
				reg, strerror(errno));
		return err;
	}

	err = read(fd, val, sizeof(*val));
	if (err < 0) {
		syslog(LOG_ERR, "failed to read value: %s",
				strerror(errno));
		return err;
	}

	return 0;
}

int set_mode(int fd, enum tvp_mode input)
{
	unsigned long flags = 0;
	int err = 0;

	switch (input) {
		case MODE_NTSC:
			flags |= ADXFB_INPUT_NTSC;
			break;

		case MODE_PAL:
		default:
			flags |= ADXFB_INPUT_PAL;
			break;
	}

	err = ioctl(fd, ADXFB_IOCTL_SET_INPUT, flags);
	if (err < 0) {
		err = -errno;
		goto out;
	}

out:
	return err;
}

int main(int argc, char *argv[])
{
	int err = 0;
	int fd = -1;
	int fb = -1;
	int addr = 0x5d;
	uint8_t reg = 0x8c;
	enum tvp_mode mode = MODE_NONE;

	openlog(daemon_name, LOG_PID, LOG_LOCAL0);
	syslog(LOG_INFO, "starting ...");

	err = daemonize(daemon_name);
	if (err < 0) {
		closelog();
		return 1;
	}

	fd = open(i2c_file, O_RDWR);
	if (fd < 0) {
		syslog(LOG_ERR, "%s: cannot open device: %s", i2c_file,
				strerror(errno));
		goto out;
	}

	err = ioctl(fd, I2C_SLAVE, addr);
	if (err < 0) {
		syslog(LOG_ERR, "%d: cannot select slave: %s", addr,
				strerror(errno));
		goto out;
	}

	fb = open(fb_file, O_RDWR);
	if (fb < 0) {
		syslog(LOG_ERR, "%s: cannot open divec: %s", fb_file,
				strerror(errno));
		goto out;
	}

	while (!done) {
		uint8_t val = 0;
		enum tvp_mode m;

		err = tvp5150_read(fd, reg, &val);
		if (err < 0) {
			syslog(LOG_ERR, "failed to read register %02x: %s",
					reg, strerror(-err));
		} else {
			if ((val & 0x07) == 0x01)
				m = MODE_NTSC;
			else
				m = MODE_PAL;

			if (m != mode) {
				set_mode(fb, m);
				mode = m;
			}
		}

		usleep(500000);
	}

	syslog(LOG_INFO, "shutting down ...");

out:
	unlock(daemon_name);
	(void)close(fb);
	(void)close(fd);
	closelog();
	return err;
}

