/*
 * igmp-join.c - simple tool to join multicast groups
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
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>

static volatile int done = 0;

static void handler(int signum)
{
	done = 1;
}

int main(int argc, char *argv[])
{
	char buffer[INET_ADDRSTRLEN];
	const char *host = NULL;
	struct sockaddr_in sin;
	uint16_t port = 4444;
	struct ip_mreq mreq;
	size_t size = 0;
	int ret = 0;
	int skt = 0;

	if (argc < 2) {
		fprintf(stderr, "usage: %s host\n", argv[0]);
		return 1;
	}

	host = argv[1];

	signal(SIGINT, handler);
	signal(SIGQUIT, handler);

	skt = socket(AF_INET, SOCK_DGRAM, 0);
	if (skt == -1) {
		perror("socket");
		return 1;
	}

	memset(&sin, 0, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_port = htons(port);

	ret = inet_pton(AF_INET, host, &sin.sin_addr);
	if (ret < 0) {
		perror("inet_pton");
		return 1;
	}

	if (!inet_ntop(AF_INET, &sin.sin_addr, buffer, sizeof(buffer))) {
		perror("inet_ntop");
		return 1;
	}

	printf("joining multicast group %s ... ", buffer);

	memset(&mreq, 0, sizeof(mreq));
	mreq.imr_interface.s_addr = htonl(INADDR_ANY);
	mreq.imr_multiaddr.s_addr = *(in_addr_t *)&sin.sin_addr;

	ret = setsockopt(skt, IPPROTO_IP, IP_ADD_MEMBERSHIP, &mreq,
			sizeof(mreq));
	if (ret < 0) {
		printf("failed\n");
		return 1;
	}

	printf("done\n");

	while (!done) {
		sleep(25);
	}

	printf("leaving multicast group %s ... ", buffer);

	ret = setsockopt(skt, IPPROTO_IP, IP_DROP_MEMBERSHIP, &mreq,
			sizeof(mreq));
	if (ret < 0) {
		printf("failed\n");
		return 1;
	}

	printf("done\n");
	close(skt);
	return ret;
}

