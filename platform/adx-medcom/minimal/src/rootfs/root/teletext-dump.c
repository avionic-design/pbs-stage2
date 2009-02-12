/*
 * teletext-dump.c
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

#include <linux/i2c-dev.h>

/* register definitions */
#define TVP5150_VD_IN_SRC_SEL_1      0x00 /* Video input source selection #1 */
#define TVP5150_ANAL_CHL_CTL         0x01 /* Analog channel controls */
#define TVP5150_OP_MODE_CTL          0x02 /* Operation mode controls */
#define TVP5150_MISC_CTL             0x03 /* Miscellaneous controls */
#define TVP5150_AUTOSW_MSK           0x04 /* Autoswitch mask: TVP5150A / TVP5150AM */

/* Reserved 05h */

#define TVP5150_COLOR_KIL_THSH_CTL   0x06 /* Color killer threshold control */
#define TVP5150_LUMA_PROC_CTL_1      0x07 /* Luminance processing control #1 */
#define TVP5150_LUMA_PROC_CTL_2      0x08 /* Luminance processing control #2 */
#define TVP5150_BRIGHT_CTL           0x09 /* Brightness control */
#define TVP5150_SATURATION_CTL       0x0a /* Color saturation control */
#define TVP5150_HUE_CTL              0x0b /* Hue control */
#define TVP5150_CONTRAST_CTL         0x0c /* Contrast control */
#define TVP5150_DATA_RATE_SEL        0x0d /* Outputs and data rates select */
#define TVP5150_LUMA_PROC_CTL_3      0x0e /* Luminance processing control #3 */
#define TVP5150_CONF_SHARED_PIN      0x0f /* Configuration shared pins */

/* Reserved 10h */

#define TVP5150_ACT_VD_CROP_ST_MSB   0x11 /* Active video cropping start MSB */
#define TVP5150_ACT_VD_CROP_ST_LSB   0x12 /* Active video cropping start LSB */
#define TVP5150_ACT_VD_CROP_STP_MSB  0x13 /* Active video cropping stop MSB */
#define TVP5150_ACT_VD_CROP_STP_LSB  0x14 /* Active video cropping stop LSB */
#define TVP5150_GENLOCK              0x15 /* Genlock/RTC */
#define TVP5150_HORIZ_SYNC_START     0x16 /* Horizontal sync start */

/* Reserved 17h */

#define TVP5150_VERT_BLANKING_START 0x18 /* Vertical blanking start */
#define TVP5150_VERT_BLANKING_STOP  0x19 /* Vertical blanking stop */
#define TVP5150_CHROMA_PROC_CTL_1   0x1a /* Chrominance processing control #1 */
#define TVP5150_CHROMA_PROC_CTL_2   0x1b /* Chrominance processing control #2 */
#define TVP5150_INT_RESET_REG_B     0x1c /* Interrupt reset register B */
#define TVP5150_INT_ENABLE_REG_B    0x1d /* Interrupt enable register B */
#define TVP5150_INTT_CONFIG_REG_B   0x1e /* Interrupt configuration register B */

/* Reserved 1Fh-27h */

#define TVP5150_VIDEO_STD           0x28 /* Video standard */

/* Reserved 29h-2bh */

#define TVP5150_CB_GAIN_FACT        0x2c /* Cb gain factor */
#define TVP5150_CR_GAIN_FACTOR      0x2d /* Cr gain factor */
#define TVP5150_MACROVISION_ON_CTR  0x2e /* Macrovision on counter */
#define TVP5150_MACROVISION_OFF_CTR 0x2f /* Macrovision off counter */
#define TVP5150_REV_SELECT          0x30 /* revision select (TVP5150AM1 only) */

/* Reserved	31h-7Fh */

#define TVP5150_MSB_DEV_ID          0x80 /* MSB of device ID */
#define TVP5150_LSB_DEV_ID          0x81 /* LSB of device ID */
#define TVP5150_ROM_MAJOR_VER       0x82 /* ROM major version */
#define TVP5150_ROM_MINOR_VER       0x83 /* ROM minor version */
#define TVP5150_VERT_LN_COUNT_MSB   0x84 /* Vertical line count MSB */
#define TVP5150_VERT_LN_COUNT_LSB   0x85 /* Vertical line count LSB */
#define TVP5150_INT_STATUS_REG_B    0x86 /* Interrupt status register B */
#define TVP5150_INT_ACTIVE_REG_B    0x87 /* Interrupt active register B */
#define TVP5150_STATUS_REG_1        0x88 /* Status register #1 */
#define TVP5150_STATUS_REG_2        0x89 /* Status register #2 */
#define TVP5150_STATUS_REG_3        0x8a /* Status register #3 */
#define TVP5150_STATUS_REG_4        0x8b /* Status register #4 */
#define TVP5150_STATUS_REG_5        0x8c /* Status register #5 */
/* Reserved	8Dh-8Fh */
 /* Closed caption data registers */
#define TVP5150_CC_DATA_INI         0x90
#define TVP5150_CC_DATA_END         0x93

 /* WSS data registers */
#define TVP5150_WSS_DATA_INI        0x94
#define TVP5150_WSS_DATA_END        0x99

/* VPS data registers */
#define TVP5150_VPS_DATA_INI        0x9a
#define TVP5150_VPS_DATA_END        0xa6

/* VITC data registers */
#define TVP5150_VITC_DATA_INI       0xa7
#define TVP5150_VITC_DATA_END       0xaf

#define TVP5150_VBI_FIFO_READ_DATA  0xb0 /* VBI FIFO read data */

/* Teletext filter 1 */
#define TVP5150_TELETEXT_FIL1_INI  0xb1
#define TVP5150_TELETEXT_FIL1_END  0xb5

/* Teletext filter 2 */
#define TVP5150_TELETEXT_FIL2_INI  0xb6
#define TVP5150_TELETEXT_FIL2_END  0xba

#define TVP5150_TELETEXT_FIL_ENA    0xbb /* Teletext filter enable */
/* Reserved	BCh-BFh */
#define TVP5150_INT_STATUS_REG_A    0xc0 /* Interrupt status register A */
#define TVP5150_INT_ENABLE_REG_A    0xc1 /* Interrupt enable register A */
#define TVP5150_INT_CONF            0xc2 /* Interrupt configuration */
#define TVP5150_VDP_CONF_RAM_DATA   0xc3 /* VDP configuration RAM data */
#define TVP5150_CONF_RAM_ADDR_LOW   0xc4 /* Configuration RAM address low byte */
#define TVP5150_CONF_RAM_ADDR_HIGH  0xc5 /* Configuration RAM address high byte */
#define TVP5150_VDP_STATUS_REG      0xc6 /* VDP status register */
#define TVP5150_FIFO_WORD_COUNT     0xc7 /* FIFO word count */
#define TVP5150_FIFO_INT_THRESHOLD  0xc8 /* FIFO interrupt threshold */
#define TVP5150_FIFO_RESET          0xc9 /* FIFO reset */
#define TVP5150_LINE_NUMBER_INT     0xca /* Line number interrupt */
#define TVP5150_PIX_ALIGN_REG_LOW   0xcb /* Pixel alignment register low byte */
#define TVP5150_PIX_ALIGN_REG_HIGH  0xcc /* Pixel alignment register high byte */
#define TVP5150_FIFO_OUT_CTRL       0xcd /* FIFO output control */
/* Reserved	CEh */
#define TVP5150_FULL_FIELD_ENA      0xcf /* Full field enable 1 */

/* Line mode registers */
#define TVP5150_LINE_MODE_INI       0xd0
#define TVP5150_LINE_MODE_END       0xfb

#define TVP5150_FULL_FIELD_MODE_REG 0xfc /* Full field mode register */
/* Reserved	FDh-FFh */

static const char *i2c_file = "/dev/i2c-0";

int tvp5150_write(int fd, uint8_t reg, uint8_t value)
{
	uint8_t buf[2] = { 0, };
	int ret = 0;

	buf[0] = reg;
	buf[1] = value;

	ret = write(fd, buf, sizeof(buf));
	if (ret < 0) {
		return -errno;
	}

	return 0;
}

int tvp5150_read(int fd, uint8_t reg, uint8_t *value)
{
	int ret = 0;

	ret = write(fd, &reg, sizeof(reg));
	if (ret < 0) {
		return -errno;
	}

	ret = read(fd, value, sizeof(*value));
	if (ret < 0) {
		return -errno;
	}

	return 0;
}

struct i2c_reg_value {
	uint8_t reg;
	uint8_t value;
};

/* Default values as sugested at TVP5150AM1 datasheet */
static const struct i2c_reg_value tvp5150_init_default[] = {
	{ /* 0x00 */ TVP5150_VD_IN_SRC_SEL_1, 0x00 },
	{ /* 0x01 */ TVP5150_ANAL_CHL_CTL,0x15 },
	{ /* 0x02 */ TVP5150_OP_MODE_CTL,0x00 },
	{ /* 0x03 */ TVP5150_MISC_CTL,0x01 },
	{ /* 0x06 */ TVP5150_COLOR_KIL_THSH_CTL,0x10 },
	{ /* 0x07 */ TVP5150_LUMA_PROC_CTL_1,0x60 },
	{ /* 0x08 */ TVP5150_LUMA_PROC_CTL_2,0x00 },
	{ /* 0x09 */ TVP5150_BRIGHT_CTL,0x80 },
	{ /* 0x0a */ TVP5150_SATURATION_CTL,0x80 },
	{ /* 0x0b */ TVP5150_HUE_CTL,0x00 },
	{ /* 0x0c */ TVP5150_CONTRAST_CTL,0x80 },
	{ /* 0x0d */ TVP5150_DATA_RATE_SEL,0x47 },
	{ /* 0x0e */ TVP5150_LUMA_PROC_CTL_3,0x00 },
	{ /* 0x0f */ TVP5150_CONF_SHARED_PIN,0x08 },
	{ /* 0x11 */ TVP5150_ACT_VD_CROP_ST_MSB,0x00 },
	{ /* 0x12 */ TVP5150_ACT_VD_CROP_ST_LSB,0x00 },
	{ /* 0x13 */ TVP5150_ACT_VD_CROP_STP_MSB,0x00 },
	{ /* 0x14 */ TVP5150_ACT_VD_CROP_STP_LSB,0x00 },
	{ /* 0x15 */ TVP5150_GENLOCK,0x01 },
	{ /* 0x16 */ TVP5150_HORIZ_SYNC_START,0x80 },
	{ /* 0x18 */ TVP5150_VERT_BLANKING_START,0x00 },
	{ /* 0x19 */ TVP5150_VERT_BLANKING_STOP,0x00 },
	{ /* 0x1a */ TVP5150_CHROMA_PROC_CTL_1,0x0c },
	{ /* 0x1b */ TVP5150_CHROMA_PROC_CTL_2,0x14 },
	{ /* 0x1c */ TVP5150_INT_RESET_REG_B,0x00 },
	{ /* 0x1d */ TVP5150_INT_ENABLE_REG_B,0x00 },
	{ /* 0x1e */ TVP5150_INTT_CONFIG_REG_B,0x00 },
	{ /* 0x28 */ TVP5150_VIDEO_STD,0x00 },
	{ /* 0x2e */ TVP5150_MACROVISION_ON_CTR,0x0f },
	{ /* 0x2f */ TVP5150_MACROVISION_OFF_CTR,0x01 },
	{ /* 0xbb */ TVP5150_TELETEXT_FIL_ENA,0x00 },
	{ /* 0xc0 */ TVP5150_INT_STATUS_REG_A,0x00 },
	{ /* 0xc1 */ TVP5150_INT_ENABLE_REG_A,0x00 },
	{ /* 0xc2 */ TVP5150_INT_CONF,0x04 },
	{ /* 0xc8 */ TVP5150_FIFO_INT_THRESHOLD,0x80 },
	{ /* 0xc9 */ TVP5150_FIFO_RESET,0x00 },
	{ /* 0xca */ TVP5150_LINE_NUMBER_INT,0x00 },
	{ /* 0xcb */ TVP5150_PIX_ALIGN_REG_LOW,0x4e },
	{ /* 0xcc */ TVP5150_PIX_ALIGN_REG_HIGH,0x00 },
	{ /* 0xcd */ TVP5150_FIFO_OUT_CTRL,0x01 },
	{ /* 0xcf */ TVP5150_FULL_FIELD_ENA,0x00 },
	{ /* 0xd0 */ TVP5150_LINE_MODE_INI,0x00 },
	{ /* 0xfc */ TVP5150_FULL_FIELD_MODE_REG,0x7f },
	{ /* end of data */ 0xff,0xff }
};

/* Default values as sugested at TVP5150AM1 datasheet */
static const struct i2c_reg_value tvp5150_init_enable[] = {
	{ TVP5150_CONF_SHARED_PIN, 2 },
	{ /* Automatic offset and AGC enabled */ TVP5150_ANAL_CHL_CTL, 0x15 },
	{ /* Activate YCrCb output 0x9 or 0xd ? */ TVP5150_MISC_CTL, 0x6f },
	{ /* Activates video std autodetection for all standards */ TVP5150_AUTOSW_MSK, 0x0 },
	{ /* Default format: 0x47. For 4:2:2: 0x40 */ TVP5150_DATA_RATE_SEL, 0x47 },
	{ TVP5150_CHROMA_PROC_CTL_1, 0x0c },
	{ TVP5150_CHROMA_PROC_CTL_2, 0x54 },
	{ /* Non documented, but initialized on WinTV USB2 */ 0x27, 0x20 },
	{ 0xff,0xff }
};

struct tvp5150_vbi_type {
	unsigned int vbi_type;
	unsigned int ini_line;
	unsigned int end_line;
	unsigned int by_field :1;
};

struct i2c_vbi_ram_value {
	uint16_t reg;
#ifdef LINUX
	struct tvp5150_vbi_type type;
#endif
	uint8_t values[16];
};

/* This struct have the values for each supported VBI Standard
 * by
 tvp5150_vbi_types should follow the same order as vbi_ram_default
 * value 0 means rom position 0x10, value 1 means rom position 0x30
 * and so on. There are 16 possible locations from 0 to 15.
 */

static struct i2c_vbi_ram_value vbi_ram_default[] =
{
	/* FIXME: Current api doesn't handle all VBI types, those not
	   yet supported are placed under #if 0 */
#if 0
	{0x010, /* Teletext, SECAM, WST System A */
		{V4L2_SLICED_TELETEXT_SECAM,6,23,1},
		{ 0xaa, 0xaa, 0xff, 0xff, 0xe7, 0x2e, 0x20, 0x26,
		  0xe6, 0xb4, 0x0e, 0x00, 0x00, 0x00, 0x10, 0x00 }
	},
#endif
	{0x030, /* Teletext, PAL, WST System B */
#ifdef LINUX
		{V4L2_SLICED_TELETEXT_B,6,22,1},
#endif
		{ 0xaa, 0xaa, 0xff, 0xff, 0x27, 0x2e, 0x20, 0x2b,
		  0xa6, 0x72, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00 }
	},
#if 0
	{0x050, /* Teletext, PAL, WST System C */
		{V4L2_SLICED_TELETEXT_PAL_C,6,22,1},
		{ 0xaa, 0xaa, 0xff, 0xff, 0xe7, 0x2e, 0x20, 0x22,
		  0xa6, 0x98, 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00 }
	},
	{0x070, /* Teletext, NTSC, WST System B */
		{V4L2_SLICED_TELETEXT_NTSC_B,10,21,1},
		{ 0xaa, 0xaa, 0xff, 0xff, 0x27, 0x2e, 0x20, 0x23,
		  0x69, 0x93, 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00 }
	},
	{0x090, /* Tetetext, NTSC NABTS System C */
		{V4L2_SLICED_TELETEXT_NTSC_C,10,21,1},
		{ 0xaa, 0xaa, 0xff, 0xff, 0xe7, 0x2e, 0x20, 0x22,
		  0x69, 0x93, 0x0d, 0x00, 0x00, 0x00, 0x15, 0x00 }
	},
	{0x0b0, /* Teletext, NTSC-J, NABTS System D */
		{V4L2_SLICED_TELETEXT_NTSC_D,10,21,1},
		{ 0xaa, 0xaa, 0xff, 0xff, 0xa7, 0x2e, 0x20, 0x23,
		  0x69, 0x93, 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00 }
	},
	{0x0d0, /* Closed Caption, PAL/SECAM */
		{V4L2_SLICED_CAPTION_625,22,22,1},
		{ 0xaa, 0x2a, 0xff, 0x3f, 0x04, 0x51, 0x6e, 0x02,
		  0xa6, 0x7b, 0x09, 0x00, 0x00, 0x00, 0x27, 0x00 }
	},
#endif
	{0x0f0, /* Closed Caption, NTSC */
#ifdef LINUX
		{V4L2_SLICED_CAPTION_525,21,21,1},
#endif
		{ 0xaa, 0x2a, 0xff, 0x3f, 0x04, 0x51, 0x6e, 0x02,
		  0x69, 0x8c, 0x09, 0x00, 0x00, 0x00, 0x27, 0x00 }
	},
	{0x110, /* Wide Screen Signal, PAL/SECAM */
#ifdef LINUX
		{V4L2_SLICED_WSS_625,23,23,1},
#endif
		{ 0x5b, 0x55, 0xc5, 0xff, 0x00, 0x71, 0x6e, 0x42,
		  0xa6, 0xcd, 0x0f, 0x00, 0x00, 0x00, 0x3a, 0x00 }
	},
#if 0
	{0x130, /* Wide Screen Signal, NTSC C */
		{V4L2_SLICED_WSS_525,20,20,1},
		{ 0x38, 0x00, 0x3f, 0x00, 0x00, 0x71, 0x6e, 0x43,
		  0x69, 0x7c, 0x08, 0x00, 0x00, 0x00, 0x39, 0x00 }
	},
	{0x150, /* Vertical Interval Timecode (VITC), PAL/SECAM */
		{V4l2_SLICED_VITC_625,6,22,0},
		{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x8f, 0x6d, 0x49,
		  0xa6, 0x85, 0x08, 0x00, 0x00, 0x00, 0x4c, 0x00 }
	},
	{0x170, /* Vertical Interval Timecode (VITC), NTSC */
		{V4l2_SLICED_VITC_525,10,20,0},
		{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x8f, 0x6d, 0x49,
		  0x69, 0x94, 0x08, 0x00, 0x00, 0x00, 0x4c, 0x00 }
	},
#endif
	{0x190, /* Video Program System (VPS), PAL */
#ifdef LINUX
		{V4L2_SLICED_VPS,16,16,0},
#endif
		{ 0xaa, 0xaa, 0xff, 0xff, 0xba, 0xce, 0x2b, 0x0d,
		  0xa6, 0xda, 0x0b, 0x00, 0x00, 0x00, 0x60, 0x00 }
	},
	/* 0x1d0 User programmable */

	/* End of struct */
	{ (uint16_t)-1 }
};

static int tvp5150_write_inittab(int fd, const struct i2c_reg_value *regs)
{
	while (regs->reg != 0xff) {
		tvp5150_write(fd, regs->reg, regs->value);
		regs++;
	}

	return 0;
}

static int tvp5150_vdp_init(int fd, const struct i2c_vbi_ram_value *regs)
{
	unsigned int i;

	/* Disable Full Field */
	tvp5150_write(fd, TVP5150_FULL_FIELD_ENA, 0);

	/* Before programming, Line mode should be at 0xff */
	for (i = TVP5150_LINE_MODE_INI; i <= TVP5150_LINE_MODE_END; i++)
		tvp5150_write(fd, i, 0xff);

	/* Load Ram Table */
	while (regs->reg != (uint16_t)-1) {
		tvp5150_write(fd, TVP5150_CONF_RAM_ADDR_HIGH, regs->reg >> 8);
		tvp5150_write(fd, TVP5150_CONF_RAM_ADDR_LOW, regs->reg);

		for (i = 0; i < 16; i++)
			tvp5150_write(fd, TVP5150_VDP_CONF_RAM_DATA, regs->values[i]);

		regs++;
	}

	return 0;
}

int main(int argc, char *argv[])
{
	int fd = -1;
	int addr = 0x5d;
	const int cols = 16;
	uint8_t offset = 0;
	uint8_t buffer[16];
	uint8_t count = 0;
	size_t i, j;
	int err = 0;
	int ret = 0;

	fd = open(i2c_file, O_RDWR);
	if (fd < 0) {
		fprintf(stderr, "%s: cannot open device: %s\n", i2c_file,
				strerror(errno));
		ret = 1;
		goto out;
	}

	err = ioctl(fd, I2C_SLAVE, addr);
	if (err < 0) {
		fprintf(stderr, "%d: cannot select slave: %s\n", addr,
				strerror(errno));
		ret = 1;
		goto out;
	}

	tvp5150_write_inittab(fd, tvp5150_init_default);
	tvp5150_vdp_init(fd, vbi_ram_default);
	//tvp5150_selmux(sd);
	tvp5150_write_inittab(fd, tvp5150_init_enable);
	tvp5150_write(fd, TVP5150_VIDEO_STD, 0x0);

	err = tvp5150_read(fd, 0xc7, &count);
	if (err < 0) {
		fprintf(stderr, "cannot read FIFO word count: %s\n",
				strerror(-err));
		ret = 1;
		goto out;
	}

	printf("FIFO word count: %d\n", count);

	for (j = 0; j < sizeof(buffer); j += cols) {
		printf("  %02x:", j);

		for (i < 0; (i < cols) && ((j + i) < sizeof(buffer)); i++) {
			printf(" %02x", buffer[j + i]);
		}

		printf("\n");
	}

out:
	(void)close(fd);
	return ret;
}

