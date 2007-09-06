PACKAGE = openssh
VERSION = 4.6p1

LOCATION = ftp://ftp.freenet.de/pub/ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

LD       = $(CC)
LDFLAGS += --sysroot $(ROOTFS)

conf-args += \
	--sysconfdir=/etc/ssh \
	--with-ssl-dir=\$${prefix}/lib/ssl \
	--with-libs=-ldl \
	--with-md5-passwords \
	--disable-strip

package-post-install:
	KEYGEN=`which ssh-keygen`; if [ -x "$$KEYGEN" ]; then \
		$(priv) $$KEYGEN -q -N '' -f $(ROOTFS)/etc/ssh/ssh_host_key -t rsa1; \
		$(priv) $$KEYGEN -q -N '' -f $(ROOTFS)/etc/ssh/ssh_host_rsa_key -t rsa; \
		$(priv) $$KEYGEN -q -N '' -f $(ROOTFS)/etc/ssh/ssh_host_dsa_key -t dsa; \
	fi
	# install init script and symlinks
	$(priv) $(INSTALL) -d $(ROOTFS)/etc/init.d
	$(priv) $(INSTALL) -m 755 packages/$(package)/openssh.init $(ROOTFS)/etc/init.d/ssh
	$(priv) $(INSTALL) -d $(ROOTFS)/etc/rc{0,1,2,3,4,5,6}.d
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc0.d/K20ssh
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc1.d/K20ssh
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc2.d/S20ssh
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc3.d/S20ssh
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc4.d/S20ssh
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc5.d/S20ssh
	$(priv) ln -sf ../init.d/ssh $(ROOTFS)/etc/rc6.d/K20ssh
	# install configuration files
	$(priv) $(INSTALL) -m 644 -t $(ROOTFS)/etc/ssh \
		packages/$(package)/ssh_config \
		packages/$(package)/sshd_config

package-clean:
	@:

