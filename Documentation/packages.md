# Packages

Packages in PBS are defined in the packages directory. They are categorized
by placing them into subdirectories. Each package is defined by a set of
files. A basic package requires the following files:

  * Kconfig     - _Defines the package within PBS._
  * Makefile    - _Controls the build process._
  * .install(s) - _Used to define the packaged files, after build._
  * watch       - _Used to check for package updates._
  * patches/    - _**Optional** patches for the package._

The PBS build system is based on and inspired by the Linux kernel build system.
If you are not familiar with Kbuild, you should read this first:
[kbuild](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild)

## Kconfig

This file defines a config variable which is used to control which package(s)
should be build. A typical Kconfig looks like this:

    config PACKAGE_<category>_<package-name>
        select PACKAGE_BUILD_TOOLS_AUTOCONF
        select PACKAGE_BUILD_TOOLS_AUTOMAKE
        help
          This is a sample package only depending on a libc implementation.


By adding ``select`` you can control the package dependencies. Each package
listed is built prior to the current package. Beware of circular dependencies!

_Please note, when using config keys in Makefiles, they must be prefixed
with ``CONFIG_``._

## Makefile

The Makefile controls the build process, but it also defines things like the
package version, the license and the place where the package sources are
located.

A simple package Makefile looks like this:

    PACKAGE = <package-name>
    VERSION = <package-version>
    LICENSE = <package-license>
    
    LOCATION = <package-download-url>
    TARBALLS = <package-tarball>
    
    include packages/autotools.mk
    
    conf-args += \
        --disable-nls
    
    prunefiles = \
        $(prefix)/lib/<library>.la
    
    stripfiles = \
        $(prefix)/lib/<program> \
        $(prefix)/lib/<library>.so

The variables are used in the parent Makefiles e.g. to download the package.
Then you can see the _include_ of another Makefile _autotools.mk_. This
defines the build targets for autotool based packages. We have more predefined
Makefiles, e.g. for CMake based packages or more commonly, autotools based
packages requiring autoreconf because of some additional patches or libtool
issues (1).

The package location is usually a URL, pointing to the release tarball. But
you can also use GIT/SVN repositories if needed.

With _conf-args_ we extend the default arguments passed to the configure
script. In this sample we disable the NLS support to save some space.

The _prunefiles_ variable defines a list of files that must be removed. In
most cases this will be libtool's la files, because these files contain
fully-qualified paths causing linker issues in sysroot environments.

The _stripfiles_ variable defines all files that should be stripped, which
means removing the debug symbols. This is an important step to save disk-space
in the final image.

(1) Some package are not tested for cross-compile support. In this case we
need to patch the build system in order to have a proper build. This means
honoring includes and changing library paths to point to the correct sysroot
instead of the building host.

### Source Links

For the development process it can come in handy to build a package from local
development sources instead of a source tarball or svn/git repository.
This is done by defining a source link. Therefore create a directory called
_source_ including the package hierarchy and a link to the package source
in your <build directory>. You should end up with a tree similar to this:

    $ tree <build directory>/source/
    <build directory>/source/
    `-- packages
        |-- kernel
        |   `-- linux -> ../../../../../../kernel/linux.git
        `-- vendor
            `-- avionic-design
                `-- remote-control -> /home/user/sources/remote-control.git

## Install Files

An install file specifies the files or directories that should be packaged
after the build step. So in this context a _package_ means a tarball created
from installed files of the package we have built.

The install file(s) are suffixed to control the files and directories that
should be part of the generated filesystem. For instance development (_-dev_)
files are pruned from the final filesystem. The same applies to documentation
(_-man, -doc_) files. Language (_-locale, -i10n_) files on the other hand
will be installed.

We also add a suffix to install files for packages containing only resource
(_-data_) files and packages containing only binaries (_-bin_).

For a fictional package _foo_ the files would look like this:

    $ cat foo-bin.install
    /usr/bin
    
    $ cat foo-data.install
    /usr/share/foo
    
    $ cat libfoo.install
    /usr/lib/*.so.*
    
    $ cat libfoo-dev.install
    /usr/include
    /usr/lib/*.a
    /usr/lib/*.so
    /usr/lib/pkg-config
    
    $ cat libfoo-man.install
    /usr/share/man

# Build Process:

Each package is built in several steps. Each step is marked complete with
a stamp file created in the package build directory ($pkgdir). The usual
build process consists of 3 major steps.

  1) Setup   - The build structure is created, the sources will be downloaded,
               verified and extracted.
  2) Build   - The package is configured and built (see Makefile). Usually the
               build is done out of tree, which means the output of the build
               process is not mixed with the original sources.
  3) Install - After a successful build, the package is installed into a
               separate directory and tarballs will be created according to
               the install files. Once the install step is done, package
               files are stored under ``$buildroot/binary/`` for later use.

The final result is a directory structure like this (simplified):

   $ tree <buildroot>/build/packages/<category>/<package>
   <package>-<version>
   |-- src
   |   `-- <source-files>
   `-- configure
   <build>/<cross-prefix>
   |-- src
   |   |-- <object-files>
   |   `-- Makefile
   `-- Makefile
   <install>
   `-- usr
       |-- bin
       |-- lib
       `-- share

All the installed files are also copied (by unpacking the created tarballs) to
the sysroot directory in the build directory.


## Stamp files

At the end of the build process the following stamp files should exist in
$pkgdir:

  * .directory  - _Setup package build dir._
  * .checksum   - _Verify package checksum for tarballs._
  * .extract    - _Sources have been extracted from tarball._
  * .setup      - _Create all directories to build._
  * .patch      - _Apply patches to the package source._
  * .configure  - _Configures the package (autotools)._
  * .build      - _Build the package._
  * .prune      - _Prune marked files._
  * .strip      - _Strip the marked files._
  * .binary     - _Create binary packages._
  * .install    - _Install in sysroot dir._

## Single Targets

These steps can be triggered partially for single packages. The most useful
are: build, rebuild and the kernel-only option configure.

To configure the kernel without changing the kernels defconfig.

	$ make O=<build directory> packages/kernel/linux/configure

Build a single package:

	$ make O=<build directory> packages/kernel/linux/build

Rebuild a single package:

	$ make O=<build directory> packages/kernel/linux/rebuild

Rebuilding a package will erase the entire package build directory first and
then build the package, meaning all changes made in the package build directory are
lost. If you modify the sources inside the build directory, you should use the
``build`` target instead of ``rebuild``.

Other useful package targets are:

  * install       - Reinstall the package.
  * binary        - Repack the package.
  * print         - Print package version.

Besides the default platform build targets rootfs and initrd, some other
notable targets are available:

  * watch             - Check for package updates.
  * print             - Print the versions of the selected packages.
  * license           - Print the license of the selected packages.
  * rebuild-sysroot   - Recreate the sysroot directory.
