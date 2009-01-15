#!/bin/sh

sdc_dev=/dev/mmcblk0p5
sdc_mnt=/media/sd-card
usb_dev=/dev/sda1
usb_mnt=/media/usb-storage
http=http://avionic-0027/~thierry
file=test-8m.dat
sdc_stat=0
usb_stat=0

function do_mount()
{
	if ! mount | grep -q $1; then
		echo -n "Mounting $1 to $2 ... "
		mkdir -p $2
		if mount $1 $2 -o noatime 2> /dev/null; then
			echo "done"
			eval $3=1
		else
			echo "failed"
		fi
	fi
}

function do_umount()
{
	if test $3 = 1; then
		echo -n "Unmounting $1 from $2 ... "
		umount $2
		echo "done"
	fi
}

function run_test()
{
	name="$1"; shift
	echo "Running test: $name ... "
	echo 3 > /proc/sys/vm/drop_caches
	time -p (
		time -p "$@" > /dev/null 2>&1
		ret=$?
		sync

		if [ "x$ret" = "x0" ]; then
			echo "success"
		else
			echo "failed"
		fi
	)
}

# mount devices
do_mount $sdc_dev $sdc_mnt sdc_stat
do_mount $usb_dev $usb_mnt usb_stat

# run tests
rm -f $file
run_test "HTTP -> RAM" wget -q $http/$file
if [ "x$sdc_stat" != "x0" ]; then
	run_test "RAM -> SD Card" \
		dd if=$file of=/media/sd-card/$file
fi
if [ "x$usb_stat" != "x0" ]; then
	run_test "RAM -> USB Storage" \
		dd if=$file of=/media/usb-storage/$file
	
	if [ "x$sdc_stat" != "x0" ]; then
		run_test "SD Card -> USB Storage" \
			dd if=$sdc_mnt/$file of=$usb_mnt/$file
		run_test "USB Storage -> SD Card" \
			dd if=$usb_mnt/$file of=$sdc_mnt/$file
	fi
fi

# unmount devices
do_umount $usb_dev $usb_mnt $usb_stat
do_umount $sdc_dev $sdc_mnt $sdc_stat

