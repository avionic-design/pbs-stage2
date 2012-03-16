PACKAGE = coreutils
VERSION = 8.15

LOCATION = ftp://ftp.gnu.org/gnu/coreutils
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-vars += \
	PERL=/do/not/run/perl/when/cross-compiling

#ifneq ($(LIBC),gnu)
#conf-vars += \
#	fu_cv_sys_stat_statvfs=yes
#endif

prunefiles =
stripfiles = \
	$(prefix)/bin/[ \
	$(prefix)/bin/base64 \
	$(prefix)/bin/basename \
	$(prefix)/bin/cat \
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
	$(prefix)/bin/head \
	$(prefix)/bin/hostid \
	$(prefix)/bin/hostname \
	$(prefix)/bin/id \
	$(prefix)/bin/install \
	$(prefix)/bin/join \
	$(prefix)/bin/kill \
	$(prefix)/bin/link \
	$(prefix)/bin/ln \
	$(prefix)/bin/logname \
	$(prefix)/bin/ls \
	$(prefix)/bin/md5sum \
	$(prefix)/bin/mkdir \
	$(prefix)/bin/mkfifo \
	$(prefix)/bin/mknod \
	$(prefix)/bin/mv \
	$(prefix)/bin/nice \
	$(prefix)/bin/nl \
	$(prefix)/bin/nohup \
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
	$(prefix)/bin/rm \
	$(prefix)/bin/rmdir \
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
	$(prefix)/bin/stty \
	$(prefix)/bin/su \
	$(prefix)/bin/sum \
	$(prefix)/bin/sync \
	$(prefix)/bin/tac \
	$(prefix)/bin/tail \
	$(prefix)/bin/tee \
	$(prefix)/bin/test \
	$(prefix)/bin/touch \
	$(prefix)/bin/tr \
	$(prefix)/bin/true \
	$(prefix)/bin/tsort \
	$(prefix)/bin/tty \
	$(prefix)/bin/uname \
	$(prefix)/bin/unexpand \
	$(prefix)/bin/uniq \
	$(prefix)/bin/unlink \
	$(prefix)/bin/uptime \
	$(prefix)/bin/users \
	$(prefix)/bin/vdir \
	$(prefix)/bin/wc \
	$(prefix)/bin/who \
	$(prefix)/bin/whoami \
	$(prefix)/bin/yes
