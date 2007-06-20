PACKAGE = openssh
VERSION = 4.6p1

LOCATION = ftp://ftp.freenet.de/pub/ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

env = env -i
LD = $(CC)
LDFLAGS := $(CFLAGS) $(LDFLAGS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--sysconfdir=/etc/ssh \
	--with-ssl-dir=\$${prefix}/lib/ssl \
	--with-libs=-ldl \
	--with-md5-passwords \
	--disable-strip \
	$(call set-args, CC CFLAGS LD LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install
	KEYGEN=`which ssh-keygen`; if [ -x "$$KEYGEN" ]; then \
		$$KEYGEN -q -N '' -f $(ROOTFS)/etc/ssh/ssh_host_key -t rsa1; \
		$$KEYGEN -q -N '' -f $(ROOTFS)/etc/ssh/ssh_host_rsa_key -t rsa; \
		$$KEYGEN -q -N '' -f $(ROOTFS)/etc/ssh/ssh_host_dsa_key -t dsa; \
	fi
	# install init script and symlinks
	$(INSTALL) -d $(ROOTFS)/etc/init.d
	$(INSTALL) -m 755 packages/$(package)/openssh.init $(ROOTFS)/etc/init.d/ssh
	$(INSTALL) -d $(ROOTFS)/etc/rc{0,1,2,3,4,5,6}.d
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc0.d/K20ssh
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc1.d/K20ssh
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc2.d/S20ssh
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc3.d/S20ssh
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc4.d/S20ssh
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc5.d/S20ssh
	ln -sf ../init.d/ssh $(ROOTFS)/etc/rc6.d/K20ssh
	# install configuration files
	$(INSTALL) -m 644 -t $(ROOTFS)/etc/ssh \
		packages/$(package)/ssh_config \
		packages/$(package)/sshd_config

