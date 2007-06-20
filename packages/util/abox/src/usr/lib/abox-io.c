#include <unistd.h>
#include <linux/ioctl.h>

/* ioctl definitions */
#define ABIO_IOC_MAGIC 0xa5

#define ABIO_IOCTPOWER_ON  _IO (ABIO_IOC_MAGIC, 0)
#define ABIO_IOCTPOWER_OFF _IO (ABIO_IOC_MAGIC, 1)
#define ABIO_IOCTBIT       _IO (ABIO_IOC_MAGIC, 2)
#define ABIO_IOCQBIT       _IO (ABIO_IOC_MAGIC, 3)
#define ABIO_IOCSDATA      _IOW(ABIO_IOC_MAGIC, 4, int)
#define ABIO_IOCGDATA      _IOR(ABIO_IOC_MAGIC, 5, int)

#define ABIO_IOC_MAXNR 5

int abox_io_open(const char *path, int flags, int mode)
{
	return open(path, flags, mode);
}

void abox_io_close(int abio)
{
	close(abio);
}

int abox_io_power_up(int abio)
{
	return ioctl(abio, ABIO_IOCTPOWER_ON);
}

int abox_io_power_down(int abio)
{
	return ioctl(abio, ABIO_IOCTPOWER_OFF);
}

int abox_io_set_bit(int abio, int bit)
{
	unsigned long arg = (bit << 1) | 0x01;
	return ioctl(abio, ABIO_IOCTBIT, arg);
}

int abox_io_clear_bit(int abio, int bit)
{
	unsigned long arg = (bit << 1) | 0x00;
	return ioctl(abio, ABIO_IOCTBIT, arg);
}

int abox_io_get_bit(int abio, int bit)
{
	return ioctl(abio, ABIO_IOCQBIT, bit);
}

int abox_io_set_data(int abio, int data)
{
	return ioctl(abio, ABIO_IOCSDATA, &data);
}

int abio_io_get_data(int abio, int *data)
{
	return ioctl(abio, ABIO_IOCGDATA, data);
}

