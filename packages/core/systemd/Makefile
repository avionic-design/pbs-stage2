PACKAGE = systemd
VERSION = 26

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

env += \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig:$(SYSROOT)$(prefix)/share/pkgconfig

conf-args += \
	--with-distro=pbs \
	--with-rootdir=

prunefiles = \
	/lib/systemd/system/multi-user.target.wants/systemd-user-sessions.service \
	/lib/systemd/system/basic.target.wants/sys-kernel-security.automount \
	/lib/systemd/system/basic.target.wants/tmpwatch.service \
	/lib/systemd/system/basic.target.wants/tmpwatch.timer \
	/lib/systemd/system/local-fs.target.wants/media.mount \
	/lib/systemd/system/media.mount \
	/lib/systemd/system/systemd-user-sessions.service \
	/lib/systemd/system/sys-kernel-security.automount \
	/lib/systemd/system/sys-kernel-security.mount \
	/lib/systemd/system/tmpwatch.service \
	/lib/systemd/system/tmpwatch.timer \
	/lib/security/pam_systemd.la

stripfiles = \
	/bin/systemctl \
	/bin/systemd \
	/bin/systemd-ask-password \
	/bin/systemd-machine-id-setup \
	/bin/systemd-notify \
	/bin/systemd-tmpfiles \
	/bin/systemd-tty-ask-password-agent \
	/lib/security/pam_systemd.so \
	/lib/systemd/systemd-ac-power \
	/lib/systemd/systemd-binfmt \
	/lib/systemd/systemd-cgroups-agent \
	/lib/systemd/systemd-detect-virt \
	/lib/systemd/systemd-fsck \
	/lib/systemd/systemd-hostnamed \
	/lib/systemd/systemd-initctl \
	/lib/systemd/systemd-kmsg-syslogd \
	/lib/systemd/systemd-logger \
	/lib/systemd/systemd-modules-load \
	/lib/systemd/systemd-quotacheck \
	/lib/systemd/systemd-random-seed \
	/lib/systemd/systemd-readahead-collect \
	/lib/systemd/systemd-readahead-replay \
	/lib/systemd/systemd-remount-api-vfs \
	/lib/systemd/systemd-reply-password \
	/lib/systemd/systemd-shutdown \
	/lib/systemd/systemd-shutdownd \
	/lib/systemd/systemd-sysctl \
	/lib/systemd/systemd-timestamp \
	/lib/systemd/systemd-update-utmp \
	/lib/systemd/systemd-user-sessions \
	/lib/systemd/systemd-vconsole-setup \
	/lib/systemd/system-generators/systemd-getty-generator \
	$(prefix)/bin/systemadm \
	$(prefix)/bin/systemd-ask-password-agent \
	$(prefix)/bin/systemd-cgls \
	$(prefix)/bin/systemd-gnome-ask-password-agent \
	$(prefix)/bin/systemd-nspawn \
	$(prefix)/bin/systemd-stdio-bridge
