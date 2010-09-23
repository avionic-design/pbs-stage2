include packages/libs/dbus-glib/Makefile.location
include packages/autotools.mk

conf-vars += \
	ac_cv_func_posix_getpwnam_r=yes \
	ac_cv_have_abstract_sockets=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/dbus-binding-tool \
	$(prefix)/lib/*.so.* \
	$(prefix)/libexec/dbus-bash-completion-helper
