#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <net/if.h>
#include <net/ethernet.h>
#include <sys/ioctl.h>
#include <sys/socket.h>

#if __WORDSIZE == 64
#define FMT_UINT64 "lu"
#else
#define FMT_UINT64 "llu"
#endif

#define min(a, b) (((a) < (b)) ? (a) : (b))

static int eth_get_hwaddr(const char *iface, uint8_t *buffer, size_t size)
{
	struct ifreq req;
	int sockfd;
	int err;

	if (!iface || !buffer || !size)
		return -EINVAL;

	sockfd = socket(AF_INET, SOCK_DGRAM, 0);
	if (sockfd < 0)
		return -errno;

	memset(&req, 0, sizeof(req));
	strncpy(req.ifr_name, iface, IFNAMSIZ);

	err = ioctl(sockfd, SIOCGIFHWADDR, &req);
	if (err < 0) {
		err = -errno;
		goto out;
	}

	memcpy(buffer, req.ifr_hwaddr.sa_data, min(size, ETH_ALEN));

out:
	close(sockfd);
	return err;
}

static int parse_mask(const char *octets, unsigned int *maskp)
{
	unsigned int start = 0;
	unsigned int last = 0;
	unsigned int mask = 0;
	unsigned int i;

	while (*octets) {
		unsigned int octet;
		char *end = NULL;

		if (*octets == '-') {
			start = last ?: 1;
			octets++;
			continue;
		}

		if (*octets == ',') {
			octets++;
			continue;
		}

		octet = strtoul(octets, &end, 10);
		if (end == octets)
			return -EINVAL;

		if ((octet == 0) || (octet > 6))
			return -EINVAL;

		if (start) {
			for (i = start; i <= octet; i++)
				mask |= 1 << i;

			start = 0;
			octet = 0;
		} else {
			if (last)
				mask |= 1 << last;
		}

		octets = end;
		last = octet;
	}

	if (start) {
		for (i = start; i <= 6; i++)
			mask |= 1 << i;
	} else {
		if (last)
			mask |= 1 << last;
	}

	if (maskp)
		*maskp = mask;

	return 0;
}

int main(int argc, char *argv[])
{
	uint8_t hwaddr[ETH_ALEN];
	unsigned int mask = 0;
	unsigned int bits = 0;
	uint64_t serial = 0;
	uint64_t max = 0;
	unsigned int i;
	int err;

	if (argc < 3) {
		fprintf(stderr, "usage: %s IFACE OCTETS\n", argv[0]);
		return 1;
	}

	err = eth_get_hwaddr(argv[1], hwaddr, sizeof(hwaddr));
	if (err < 0) {
		fprintf(stderr, "eth_get_hwaddr(): %s\n", strerror(-err));
		return 1;
	}

	err = parse_mask(argv[2], &mask);
	if (err < 0) {
		fprintf(stderr, "parse_mask(): %s\n", strerror(-err));
		return 1;
	}

	for (i = 0; i < ETH_ALEN; i++) {
		if (mask & (1 << (i + 1))) {
			serial = (serial << 8) | hwaddr[i];
			bits += 8;
		}
	}

	max = (1 << bits) - 1;
	i = 0;

	while (max) {
		max /= 10;
		i++;
	}

	printf("%0*" FMT_UINT64 "\n", i, serial);
	return 0;
}
