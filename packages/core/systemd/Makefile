include packages/core/systemd/Makefile.location
include packages/autotools.mk

env += \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig:$(SYSROOT)$(prefix)/share/pkgconfig

conf-args += \
	--with-syslog-service=syslog.service \
	--with-sysvinit-path=/etc/init.d \
	--with-sysvrcd-path=/etc \
	--with-getty="/sbin/getty -L 38400" \
	--with-distro=other \
	--with-rootdir=

prunefiles = \
	/lib/security/pam_systemd.la

stripfiles = \
	/bin/systemctl \
	/bin/systemd \
	/bin/systemd-notify \
	/lib/security/pam_systemd.so \
	/lib/systemd/systemd-cgroups-agent \
	/lib/systemd/systemd-initctl \
	/lib/systemd/systemd-kmsg-syslogd \
	/lib/systemd/systemd-logger \
	/lib/systemd/systemd-modules-load \
	/lib/systemd/systemd-random-seed \
	/lib/systemd/systemd-remount-api-vfs \
	/lib/systemd/systemd-shutdownd \
	/lib/systemd/systemd-update-utmp \
	$(prefix)/bin/systemadm \
	$(prefix)/bin/systemd-cgls
