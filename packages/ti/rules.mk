#
# Rules for the build makefiles (not the PBS one)
#

include $(srctree)/packages/ti/common.mk

BUILD += $(BUILD-y)

.PHONY: all
all: $(BUILD)

.PHONY: clean
clean:

cmd_install = mkdir -p $(@D) && cp $< $@

define add-build
$(1)_DIR ?= .
$(1)_HDR := $$(addprefix $$($(1)_DIR)/,$$($(1)_HDR))
$(1)_SRC := $$(addprefix $$($(1)_DIR)/,$$($(1)_SRC))
$(1)_OBJ := $$(addsuffix .o,$$($(1)_SRC))
OBJS     += $$($(1)_OBJ)
$(1): $$($(1)_OBJ)
$(1): CFLAGS   += $$($(1)_CFLAGS)
$(1): CPPFLAGS += $$($(1)_CPPFLAGS)
$(1): CXXFLAGS += $$($(1)_CXXFLAGS)
$(1): LDLIBS   += $$($(1)_LDLIBS)
$(1): LDFLAGS  += $$($(1)_LDFLAGS)

$$($(1)_OBJ): $$($(1)_DEP)
$$($(1)_OBJ): CFLAGS   += $$($(1)_CFLAGS)
$$($(1)_OBJ): CPPFLAGS += $$($(1)_CPPFLAGS)
$$($(1)_OBJ): CXXFLAGS += $$($(1)_CXXFLAGS)


.PHONY: clean-$(1)
clean-$(1):
	rm -f $$($(1)_OBJ) $(1)

clean: clean-$(1)

$(1)_INSTALL_DIR       := $(DESTDIR)/$(prefix)
$(1)_INSTALL_HDR_DIR   := $$($(1)_INSTALL_DIR)/include
$(1)_INSTALL_LIB_DIR   := $$($(1)_INSTALL_DIR)/lib
$(1)_INSTALL_BIN_DIR   := $$($(1)_INSTALL_DIR)/bin

$$($(1)_INSTALL_HDR_DIR)/%.h: $(SRC_DIR)/%.h
	$$(cmd_install)

.PHONY: install-hdr-$(1)
install-hdr-$(1): $$(addprefix $$($(1)_INSTALL_HDR_DIR)/,$$($(1)_HDR))

.PHONY: install-$(1)
install-$(1): install-hdr-$(1)

ifneq ($$($(1)_SRC),)
$$($(1)_INSTALL_LIB_DIR)/%.a: %.a
	$$(cmd_install)

$$($(1)_INSTALL_LIB_DIR)/%.so: %.so
	$$(cmd_install)

.PHONY: install-lib-$(1)
install-lib-$(1): $$(addprefix $$($(1)_INSTALL_LIB_DIR)/,$$(filter %.a %.so,$(1)))
install-$(1): install-lib-$(1)

$$($(1)_INSTALL_BIN_DIR)/%: %
	$$(cmd_install)

.PHONY: install-bin-$(1)
install-bin-$(1): $$(addprefix $$($(1)_INSTALL_BIN_DIR)/,$$(filter-out %.a %.so,$(1)))
install-$(1): install-bin-$(1)
endif


.PHONY: install
install: install-$(1)

endef

$(foreach b,$(BUILD),$(eval $(call add-build,$(b))))

OBJS_c    := $(filter %.c.o,$(OBJS))
OBJS_cpp  := $(filter %.cpp.o,$(OBJS))

ifneq ($(OBJS_c),)
$(OBJS_c): %.c.o: $(SRC_DIR)/%.c
	@test -d $(@D) || mkdir -p $(@D)
	$(COMPILE.c) $(OUTPUT_OPTION) $<
endif

ifneq ($(OBJS_cpp),)
$(OBJS_cpp): %.cpp.o: $(SRC_DIR)/%.cpp
	@test -d $(@D) || mkdir -p $(@D)
	$(COMPILE.cpp) $(OUTPUT_OPTION) $<
endif

%.a:
	@test -d $(@D) || mkdir -p $(@D)
	@rm -f $@
	$(AR) $(ARFLAGS) $@ $+

SHARED_OPTION = -shared
LINK.so = $(LINK.c) $(SHARED_OPTION)

%.so:
	@test -d $(@D) || mkdir -p $(@D)
	$(LINK.so) $^ $(LOADLIBES) $(LDLIBS) -o $@
