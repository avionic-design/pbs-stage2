include packages/libs/libgcrypt/Makefile.location
include packages/autotools.mk

conf-args += \
	--with-gpg-error-prefix=$(SYSROOT)$(prefix) \
	--disable-asm

config-scriptfiles = \
	$(prefix)/bin/libgcrypt-config

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/dumpsexp \
	$(prefix)/bin/hmac256 \
	$(prefix)/lib/*.so.*
