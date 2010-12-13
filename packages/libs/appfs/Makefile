PACAKGE = appfs
VERSION = git

GIT_URL = ssh://$(GIT_USER)@git.adnet.avionic-design.de/git/avionic-design/appfs.git
include packages/autotools-git.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
