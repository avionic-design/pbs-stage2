quiet_cmd_platform_cleandir = CLEAN     $<
      cmd_platform_cleandir = rm -rf $<

quiet_cmd_platform_clean = CLEAN     $<
      cmd_platform_clean = rm -f $<

platform-clean-dirs	:= $(addprefix platform-clean-,	\
		$(wildcard $(platform-clean-dirs)))
platform-clean-files	:= $(addprefix platform-clean-,	\
		$(wildcard $(platform-clean-files)))

$(platform-clean-dirs): platform-clean-%: %
	$(call cmd,platform_cleandir)

$(platform-clean-files): platform-clean-%: %
	$(call cmd,platform_clean)

PHONY += platform-cleanup
platform-cleanup: $(platform-clean-dirs) $(platform-clean-files)
	@:

