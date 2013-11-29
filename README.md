# What is PBS:

PBS is the Platform Build System. It is a set of scripts that automatically
build a defined set of software packages that can be installed in a root
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

A package is any software component that can be built in an automated way.

A platform is a collection of packages and some additional files and scripts
to complete the filesystem.


# Building a toolchain:

To build a platform you need a toolchain. PBS is able to provide you
toolchains for various architectures, which can be build from PBS.
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

	$ sudo make O=<build directory> initrd
	(outputs <build directory>/uImage, uboot image)

and

	$ sudo make O=<build directory> rootfs
	(outputs <build directory>/rootfs.img, compressed squashfs)

This will pack all relevant files into a single compressed file, to be used
by the bootloader or later from the kernel. This process will exclude all
development and documentation files from the target filesystem to save space.

NOTE: If you set INITRD_MOUNT_TMPFS=n or ROOTFS_MOUNT_TMPFS=n you don't need
superuser permissions (sudo) anymore. But to preserve the fileownership you
need to use fakeroot instead.


# Packages:

Packages in PBS are defined in the packages directory. They are categorized
by placing them into subdirectories.
To define a new packages, create a new directory with the name of the new
package in packages folder or even better in on of its subdirectories.
Building the package requires basically two files. The first one is a Kconfig
file. It defines the config variable for the package and is responsible
for dependency tracking. The second file is the Makefile which defines the
actual build process. To simplify package definition we have several
predefined profiles. The most common and recommended type of packages is
auto-tools based (include package/autotools.mk).
Once you're done with Makefile and Kconfig, you have to update the Kconfig and
Makefile of the parent directory. Otherwise the new package is not known.
Finally you'll need to update one of the checksum files (usually sha256).

For the development process it can be handy, to build a package from
development sources instead of a source tarball or svn/git repository.
This is done by defining a source link. Therefor go the <build directory> and
create a directory called "source" as well as the package hierarchie and
create a link to the package source e.g.

	$ tree <build directory>/source/
	<build directory>/source/
	`-- packages
	    |-- libs
	    |   `-- libmodem -> ../../../../../../avionic-design/libmodem
	    `-- vendor
	        `-- medcom-wide
	            `-- utils -> /home/user/sources/utils


# Build Process:

Each package is build in several steps. Each steps is marked complete with
stamp files created in the build directory. At the end of the build process
the following files are exist:

  * .directory      - Setup package build dir.
  * .checksum       - Verify package checksum.
  * .extract        - Soucres have been extracted.
  * .setup          - Create all directories to build.
  * .patch          - Apply patches to the package source.
  * .configure      - Configures the package (autotools).
  * .build          - Build the package.
  * .prune          - Prune marked files.
  * .strip          - Strip the marked files.
  * .binary         - Create binary packages.
  * .install        - Install in sysroot dir.

These steps can by triggered partially for single packages. The most useful
are: build, rebuild and the kernel only option configure.

To configure the kernel without changing the kernels defconfig.

	$ make O=<build directory> packages/kernel/linux/configure

Build a single package:

	$ make O=<build directory> packages/kernel/linux/build

Rebuild a single package:

	$ make O=<build directory> packages/kernel/linux/rebuild

Rebuilding a package will erase the entire package build directory first and
then build the package. So all changes made in the package build directory are
lost.

Other useful package targets are:

  * install       - Reinstall the package.
  * binary        - Repack the package.
  * print         - Print package version.

Besides the default platform build targets rootfs and initrd, we have some
targets been notable as well:

  * watch             - Check for package updates.
  * print             - Print the versions of the selected packages.
  * license           - Print the license of the selected packages.
  * rebuild-sysroot   - Recreate the sysroot directory.


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
  * docbook-dtds,docbook-style-xsl
    * Ubuntu: docbook-xml, docbook-xsl
  * xmlto

Libraries and tools required during platform setup:

  * gperf               (core/udev - uclibc toolchain)
  * luadoc              (wm/awesome)
  * ImageMagick         (wm/awesome)
    * Ubuntu: imagemagick
  * docbook-utils       (net/tunctl)
