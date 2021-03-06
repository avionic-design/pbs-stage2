PACKAGE = coreutils
VERSION = 8.27
LICENSE = GPL

LOCATION = ftp://ftp.gnu.org/gnu/coreutils
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

unneeded_binaries =
ifeq ($(CONFIG_PACKAGE_CORE_UTIL_LINUX),y)
  unneeded_binaries += kill
else
  stripfiles += $(prefix)/bin/kill
endif

ifeq ($(CONFIG_PACKAGE_CORE_PROCPS),y)
  unneeded_binaries += uptime
else
  stripfiles += $(prefix)/bin/uptime
endif

comma:= ,
empty:=
space:= $(empty) $(empty)
conf-args += \
	--enable-no-install-program=$(subst $(space),$(comma),$(strip $(unneeded_binaries)))

conf-vars += \
	ac_cv_func_canonicalize_file_name=yes \
	gl_cv_func_realpath_works=yes \
	PERL=no

stripfiles += \
	$(prefix)/bin/[ \
	$(prefix)/bin/base64 \
	$(prefix)/bin/basename \
	$(prefix)/bin/cat \
	$(prefix)/bin/chcon \
	$(prefix)/bin/chgrp \
	$(prefix)/bin/chmod \
	$(prefix)/bin/chown \
	$(prefix)/bin/chroot \
	$(prefix)/bin/cksum \
	$(prefix)/bin/comm \
	$(prefix)/bin/cp \
	$(prefix)/bin/csplit \
	$(prefix)/bin/cut \
	$(prefix)/bin/date \
	$(prefix)/bin/dd \
	$(prefix)/bin/df \
	$(prefix)/bin/dir \
	$(prefix)/bin/dircolors \
	$(prefix)/bin/dirname \
	$(prefix)/bin/du \
	$(prefix)/bin/echo \
	$(prefix)/bin/env \
	$(prefix)/bin/expand \
	$(prefix)/bin/expr \
	$(prefix)/bin/factor \
	$(prefix)/bin/false \
	$(prefix)/bin/fmt \
	$(prefix)/bin/fold \
	$(prefix)/bin/groups \
	$(prefix)/bin/head \
	$(prefix)/bin/hostid \
	$(prefix)/bin/hostname \
	$(prefix)/bin/id \
	$(prefix)/bin/install \
	$(prefix)/bin/join \
	$(prefix)/bin/link \
	$(prefix)/bin/ln \
	$(prefix)/bin/logname \
	$(prefix)/bin/ls \
	$(prefix)/bin/md5sum \
	$(prefix)/bin/mkdir \
	$(prefix)/bin/mkfifo \
	$(prefix)/bin/mknod \
	$(prefix)/bin/mktemp \
	$(prefix)/bin/mv \
	$(prefix)/bin/nice \
	$(prefix)/bin/nl \
	$(prefix)/bin/nohup \
	$(prefix)/bin/nproc \
	$(prefix)/bin/od \
	$(prefix)/bin/paste \
	$(prefix)/bin/pathchk \
	$(prefix)/bin/pinky \
	$(prefix)/bin/pr \
	$(prefix)/bin/printenv \
	$(prefix)/bin/printf \
	$(prefix)/bin/ptx \
	$(prefix)/bin/pwd \
	$(prefix)/bin/readlink \
	$(prefix)/bin/realpath \
	$(prefix)/bin/rm \
	$(prefix)/bin/rmdir \
	$(prefix)/bin/runcon \
	$(prefix)/bin/seq \
	$(prefix)/bin/sha1sum \
	$(prefix)/bin/sha224sum \
	$(prefix)/bin/sha256sum \
	$(prefix)/bin/sha384sum \
	$(prefix)/bin/sha512sum \
	$(prefix)/bin/shred \
	$(prefix)/bin/shuf \
	$(prefix)/bin/sleep \
	$(prefix)/bin/sort \
	$(prefix)/bin/split \
	$(prefix)/bin/stat \
	$(prefix)/bin/stdbuf \
	$(prefix)/bin/stty \
	$(prefix)/bin/su \
	$(prefix)/bin/sum \
	$(prefix)/bin/sync \
	$(prefix)/bin/tac \
	$(prefix)/bin/tail \
	$(prefix)/bin/tee \
	$(prefix)/bin/test \
	$(prefix)/bin/timeout \
	$(prefix)/bin/touch \
	$(prefix)/bin/tr \
	$(prefix)/bin/true \
	$(prefix)/bin/truncate \
	$(prefix)/bin/tsort \
	$(prefix)/bin/tty \
	$(prefix)/bin/uname \
	$(prefix)/bin/unexpand \
	$(prefix)/bin/uniq \
	$(prefix)/bin/unlink \
	$(prefix)/bin/users \
	$(prefix)/bin/vdir \
	$(prefix)/bin/wc \
	$(prefix)/bin/who \
	$(prefix)/bin/whoami \
	$(prefix)/bin/yes \
	$(prefix)/libexec/$(PACKAGE)/libstdbuf.so
