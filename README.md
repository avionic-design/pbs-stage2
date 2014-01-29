# What is PBS:

PBS is the Platform Build System. It is a set of scripts that automatically
builds a defined set of software packages that can be installed in a root
filesystem or as an initial ramdisk.

PBS builds everything from source. To do this, it downloads software tarballs
from the internet and runs the contained build system to configure, build and
install each package.

**Note:** For a quickstart with step by step guidance please see this
[HowTo](./Documentation/linux-howto).

The source tree contains the following directories:

  * Documentation:  This should be your starting point.
  * arch:           Architecture-specific definitions.
  * checksums:      Checksum files to verify downloaded files against.
  * configs:        Platform configuration files.
  * download:       Destination directory for downloaded files.
  * packages:       Package build scripts.
  * platforms:      Platform build scripts.
  * scripts:        PBS-related scripts and makefiles.
  * support:        Miscellaneous support files.
  * toolchains:     Cross-compilation toolchains (deprecated).

In order to keep this tree clean, platforms should be built in separate build
directories. Typically, such a build directory would reside below the build
subdirectory in the source tree. We recommend to use the following scheme.

	build/<platform>

By passing the path (absolute or relative) to the build directory in the "O"
(output) variable, the PBS will know where to put temporary files.


# Packages and platforms:

A platform is a collection of packages and some additional files and scripts
to complete the filesystem.
For more informations please see: [Platforms](./Documentation/platforms.md)

A package is any software component that can be built in an automated way.
For more informations please see: [Packages](./Documentation/packages.md)


# Building a toolchain:

To build a platform you need a toolchain. PBS is able to provide toolchains
for various architectures, which can be build from PBS.
See Documentation/toolchains for details.

But you can also use an external toolchain, for instance a toolchain provided
by your distribution. To use such a toolchain you have to update your pbs.mk
file. See Documentation/user-configuration for more details.


# Configuring a platform:

The recommended way to setup and configure a platform is to use a platform
defconfig. These files are located under <pbsdir>/configs. These defconfigs
contain the toolchain to use, the kernel configuration and a packages
selections for this package for this platform.

	$ make O=<build directory> <platform>_defconfig

If you like to change a the platform settings or create a new platform this
can be done with the following command:

	$ make O=<build directory> menuconfig

When this command executes, it shows a dialog where the target hardware can be
configured and individual packages be selected for later inclusion in the root
filesystem.

PBS uses Kconfig to allow easy selection of software packages that are to be
built. Based on this configuration it generates a dependency list to make sure
that packets are built in the correct order.


# Building a platform:

Build a platform is done with the following command:

	$ make O=<build directory>

Where <build directory> is the directory where you already ran the menuconfig
command or used a default platform configuration.

Once the build is completed, you need to generate the target filesystem. The
most common targets are:

	$ fakeroot make O=<build directory> initrd
	(outputs <build directory>/uImage, uboot image)

and

	$ fakeroot make O=<build directory> rootfs
	(outputs <build directory>/rootfs.img, compressed squashfs)

This will pack all relevant files into a single compressed file, to be used
by the bootloader or later by the kernel. This process will exclude all
development and documentation files from the target filesystem to save space.

**NOTE:** If you set INITRD_MOUNT_TMPFS=y or ROOTFS_MOUNT_TMPFS=y you will need
superuser permissions (sudo).

For more details regarding the build process please refer to:
  * [Packages](./Documentation/packages.md)
  * [Platforms](./Documentation/platforms.md)


# Requirements:

General requirements:

  * automake, autoconf, gcc, make, quilt, bash, fakeroot

  * ncurses-devel       (menuconfig)
  * expat-devel         (build-tools/dbus)
  * zlib-devel          (build-tools/glib)
  * libffi-devel        (build-tools/glib)
  * libpng-devel        (build-tools/gdk-pixbuf)
  * perl-XML-Simple     (build-tools/icon-naming-utils)
    * Ubuntu: libxml-simple-perl


Programs used to generate documentation during package creation:

  * texinfo
  * xmlto

Libraries and tools required during platform setup:

  * gperf               (core/udev - uclibc toolchain)
  * luadoc              (wm/awesome)
  * ImageMagick         (wm/awesome)
    * Ubuntu: imagemagick
  * docbook-utils       (net/tunctl)
