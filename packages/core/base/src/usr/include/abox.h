#ifndef ABOX_H
#define ABOX_H 1

int abox_io_open(const char *path, int flags, int mode);
void abox_io_close(int abio);
int abox_io_power_up(int abio);
int abox_io_power_down(int abio);
int abox_io_set_bit(int abio, int bit);
int abox_io_clear_bit(int abio, int bit);
int abox_io_get_bit(int abio, int bit);
int abox_io_set_data(int abio, int data);
int abox_io_get_data(int abio, int *data);

#endif /* !ABOX_H */

