# Awk script to config a Kconfig to m4
BEGIN {
    FS = "[= \t]"
    print "m4_divert(-1)"
}

/^CONFIG_.*=y/ {
    print "m4_define(`" $1 "')"
}

match($0, /^(CONFIG_.*)="(.*)"/, m) {
    print "m4_define(`" m[1] "',`" m[2] "')"
}

END {
    print "m4_divert(0)"
}
