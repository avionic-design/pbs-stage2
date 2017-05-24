include packages/core/systemd/Makefile.location
include packages/build-tools/autotools-reconf.mk

conf-args += \
	--with-rootprefix= \
	--disable-nls \
	--disable-lto \
	--disable-dbus \
	--disable-utmp \
	--disable-kmod \
	--disable-xkbcommon \
	--disable-blkid \
	--disable-seccomp \
	--disable-ima \
	--disable-selinux \
	--disable-apparmor \
	--disable-adm-group \
	--disable-wheel-group \
	--disable-xz \
	--disable-zlib \
	--disable-bzip2 \
	--disable-lz4 \
	--disable-pam \
	--disable-acl \
	--disable-smack \
	--disable-gcrypt \
	--disable-audit \
	--disable-elfutils \
	--disable-libcryptsetup \
	--disable-qrencode \
	--disable-gnutls \
	--disable-microhttpd \
	--disable-libcurl \
	--disable-libidn \
	--disable-libiptc \
	--disable-binfmt \
	--disable-vconsole \
	--disable-quotacheck \
	--disable-tmpfiles \
	--disable-environment-d \
	--disable-sysusers \
	--disable-firstboot \
	--disable-randomseed \
	--disable-backlight \
	--disable-rfkill \
	--disable-logind \
	--disable-machined \
	--disable-importd \
	--disable-hostnamed \
	--disable-timedated \
	--disable-timesyncd \
	--disable-localed \
	--disable-coredump \
	--disable-polkit \
	--disable-resolved \
	--disable-networkd \
	--disable-efi \
	--disable-myhostname \
	--disable-hwdb \
	--disable-manpages \
	--disable-hibernate \
	--disable-ldconfig \
	--disable-split-usr \
	--disable-tests \
	--without-python \
	--with-sysvinit-path= \
	--with-sysvrcnd-path=

conf-vars += \
	cc_cv_CFLAGS__flto=no

install-args += \
	DESTDIR=$(prefix)

$(pkgtree)/.intltoolize:
	cd $(pkgbuildtree) && \
		$(env) intltoolize --automake --force
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.intltoolize

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
	$(systemunitdir)/resolv.conf \
	$(prefix)/lib/security/pam_systemd.la \
	$(prefix)/lib/tmpfiles.d/tmp.conf \
	$(prefix)/lib/systemd/*.la \
	$(prefix)/lib/systemd/systemd* \
	$(prefix)/lib/*.la
