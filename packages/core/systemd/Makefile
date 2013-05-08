PACKAGE = systemd
VERSION = 203
LICENSE = GPL LGPL MIT

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--with-firmware-path=$(prefix)/lib/firmware \
	--with-rootprefix=$(prefix) \
	--libexecdir=$(prefix)/lib \
	--enable-split-usr \
	--disable-selinux \
	--without-python \
	--disable-gcrypt \
	--disable-audit \
	--disable-ssp \
	--disable-acl

ifneq ($(CONFIG_PACKAGE_CORE_SYSTEMD_ENABLE_BINFMT),y)
conf-args += --disable-binfmt
endif

ifneq ($(CONFIG_UDEV_SYSTEMD),y)
  conf-args += --disable-gudev
else
  conf-args += --enable-gudev
endif

conf-vars += \
	ac_cv_func_malloc_0_nonnull=yes

compat-links = \
	/bin/systemctl \
	/bin/systemd

compat-links := $(addprefix $(DESTDIR),$(compat-links))

$(compat-links): $(DESTDIR)%: $(obj)/src%
	$(call cmd,install_link)

$(pkgtree)/.prune: $(compat-links)

systemunitdir = $(prefix)/lib/systemd/system

prunefiles = \
	$(systemunitdir)/multi-user.target.wants/systemd-user-sessions.service \
	$(systemunitdir)/basic.target.wants/sys-kernel-security.automount \
	$(systemunitdir)/sysinit.target.wants/sys-kernel-security.mount \
	$(systemunitdir)/basic.target.wants/tmpwatch.service \
	$(systemunitdir)/basic.target.wants/tmpwatch.timer \
	$(systemunitdir)/local-fs.target.wants/media.mount \
	$(systemunitdir)/media.mount \
	$(systemunitdir)/systemd-user-sessions.service \
	$(systemunitdir)/sys-kernel-security.automount \
	$(systemunitdir)/sys-kernel-security.mount \
	$(systemunitdir)/tmpwatch.service \
	$(systemunitdir)/tmpwatch.timer \
	$(prefix)/lib/security/pam_systemd.la \
	$(prefix)/lib/tmpfiles.d/tmp.conf \
	$(prefix)/lib/*.la \

ifneq ($(CONFIG_PACKAGE_DESKTOP_PLYMOUTH),y)
prunefiles += \
	$(systemunitdir)/halt.target.wants/plymouth-halt.service \
	$(systemunitdir)/kexec.target.wants/plymouth-kexec.service \
	$(systemunitdir)/multi-user.target.wants/plymouth-quit.service \
	$(systemunitdir)/multi-user.target.wants/plymouth-quit-wait.service \
	$(systemunitdir)/plymouth-halt.service \
	$(systemunitdir)/plymouth-kexec.service \
	$(systemunitdir)/plymouth-poweroff.service \
	$(systemunitdir)/plymouth-quit.service \
	$(systemunitdir)/plymouth-quit-wait.service \
	$(systemunitdir)/plymouth-read-write.service \
	$(systemunitdir)/plymouth-reboot.service \
	$(systemunitdir)/plymouth-start.service \
	$(systemunitdir)/poweroff.target.wants/plymouth-poweroff.service \
	$(systemunitdir)/reboot.target.wants/plymouth-reboot.service \
	$(systemunitdir)/sysinit.target.wants/plymouth-read-write.service \
	$(systemunitdir)/sysinit.target.wants/plymouth-start.service
endif

stripfiles = \
	$(prefix)/bin/hostnamectl \
	$(prefix)/bin/journalctl \
	$(prefix)/bin/localectl \
	$(prefix)/bin/loginctl \
	$(prefix)/bin/systemctl \
	$(prefix)/bin/systemd-ask-password \
	$(prefix)/bin/systemd-cat \
	$(prefix)/bin/systemd-cgls \
	$(prefix)/bin/systemd-cgtop \
	$(prefix)/bin/systemd-coredumpctl \
	$(prefix)/bin/systemd-delta \
	$(prefix)/bin/systemd-detect-virt \
	$(prefix)/bin/systemd-inhibit \
	$(prefix)/bin/systemd-machine-id-setup \
	$(prefix)/bin/systemd-notify \
	$(prefix)/bin/systemd-nspawn \
	$(prefix)/bin/systemd-stdio-bridge \
	$(prefix)/bin/systemd-tmpfiles \
	$(prefix)/bin/systemd-tty-ask-password-agent \
	$(prefix)/bin/timedatectl \
	$(prefix)/bin/udevadm \
	$(prefix)/lib/security/pam_systemd.so \
	$(prefix)/lib/systemd/systemd \
	$(prefix)/lib/systemd/systemd-ac-power \
	$(prefix)/lib/systemd/systemd-cgroups-agent \
	$(prefix)/lib/systemd/systemd-coredump \
	$(prefix)/lib/systemd/systemd-fsck \
	$(prefix)/lib/systemd/systemd-hostnamed \
	$(prefix)/lib/systemd/systemd-initctl \
	$(prefix)/lib/systemd/systemd-journald \
	$(prefix)/lib/systemd/systemd-localed \
	$(prefix)/lib/systemd/systemd-logind \
	$(prefix)/lib/systemd/systemd-modules-load \
	$(prefix)/lib/systemd/systemd-multi-seat-x \
	$(prefix)/lib/systemd/systemd-quotacheck \
	$(prefix)/lib/systemd/systemd-random-seed \
	$(prefix)/lib/systemd/systemd-readahead \
	$(prefix)/lib/systemd/systemd-remount-fs \
	$(prefix)/lib/systemd/systemd-reply-password \
	$(prefix)/lib/systemd/systemd-shutdown \
	$(prefix)/lib/systemd/systemd-shutdownd \
	$(prefix)/lib/systemd/systemd-sleep \
	$(prefix)/lib/systemd/systemd-sysctl \
	$(prefix)/lib/systemd/systemd-timedated \
	$(prefix)/lib/systemd/systemd-timestamp \
	$(prefix)/lib/systemd/systemd-udevd \
	$(prefix)/lib/systemd/systemd-update-utmp \
	$(prefix)/lib/systemd/systemd-user-sessions \
	$(prefix)/lib/systemd/systemd-vconsole-setup \
	$(prefix)/lib/systemd/system-generators/systemd-fstab-generator \
	$(prefix)/lib/systemd/system-generators/systemd-getty-generator \
	$(prefix)/lib/systemd/system-generators/systemd-system-update-generator \
	$(prefix)/lib/udev/accelerometer \
	$(prefix)/lib/udev/ata_id \
	$(prefix)/lib/udev/cdrom_id \
	$(prefix)/lib/udev/collect \
	$(prefix)/lib/udev/keymap \
	$(prefix)/lib/udev/mtd_probe \
	$(prefix)/lib/udev/scsi_id \
	$(prefix)/lib/udev/v4l_id \
	$(prefix)/lib/*.so.*

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD_ENABLE_BINFMT),y)
stripfiles += \
	$(prefix)/lib/systemd/systemd-binfmt
endif
