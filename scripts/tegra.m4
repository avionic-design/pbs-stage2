m4_divert(-1)
m4_dnl Helper for multi.its.m4 to generate the proper load address
m4_dnl for T20 and T30.
m4_ifdef([CONFIG_ARCH_TEGRA_3x_SOC], [
	m4_define([MEMORY_BASE], [0x80000000])
], [
	m4_define([MEMORY_BASE], [0x00000000])
])
m4_define([ADDRESS],[m4_format([0x%08x], m4_eval(MEMORY_BASE | $1))])
m4_divert(0)
