# common definitions for packages

set-args = $(foreach arg, $(1), $(arg)='$($(arg))')

bootstrap-prefix ?= /bootstrap
core-prefix      ?= /core
devel-prefix     ?= /tools

