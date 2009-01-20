#!/bin/sh

#
# port mappings are as follows:
#
# port | diagram | description
# ------------------------------------------
#    0 |       2 | Multicast & DHCP server
#    1 |       4 | WLAN
#    2 |       - | unused
#    3 |       - | unused
#    4 |       3 | Service Network 
#    5 |       1 | Xanthos Ethernet MAC
#

modprobe ethoc
ifconfig eth0 192.168.1.1

# enable VLAN and multicast learning
switchctrl -i eth0 phy 0x14 write 0x0d 0x0029
# clear VLAN table
switchctrl -i eth0 phy 0x16 write 0x00 0x8000
# enable tag-based VLAN on ports 0-5 and use
# PVID to classify VLAN on ports 0-1
switchctrl -i eth0 phy 0x16 write 0x00 0x00ff
# set PVID for port 0
switchctrl -i eth0 phy 0x16 write 0x04 0x0002
# set PVID for port 1
switchctrl -i eth0 phy 0x16 write 0x05 0x0003
# enable VLAN groups 0 and 1
switchctrl -i eth0 phy 0x16 write 0x0a 0x0003
# set VLAN ID for group 0
switchctrl -i eth0 phy 0x16 write 0x0e 0x2002
# set VLAN ID for group 1
switchctrl -i eth0 phy 0x16 write 0x0f 0x3003
# set port memberships for VLAN 0 and 1
switchctrl -i eth0 phy 0x17 write 0x00 0x2a29
# add VLAN tags for VLAN 0 and 1 (ports 4 & 5)
switchctrl -i eth0 phy 0x17 write 0x08 0x2828
# remove VLAN tags for VLAN 0 (ports 0 and 1)
switchctrl -i eth0 phy 0x17 write 0x10 0x0201

vconfig add eth0 2
ifconfig eth0.2 192.168.2.1
vconfig add eth0 3
ifconfig eth0.3 192.168.3.1

