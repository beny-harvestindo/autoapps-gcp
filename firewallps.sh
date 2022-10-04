#!/bin/bash

#set -ex

IPVPS=
IPPS=
IPROUTER=

echo "wait for port to open SSH Router." \
&& sleep 5 \
###################################################
# Opening SSH to port 2222 #
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 2222 -d $IPVPS -j DNAT --to-destination $IPROUTER:22 \
&& iptables -t nat -A POSTROUTING -d $IPROUTER -p tcp --dport 22 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 2222 -d $IPVPS -j DNAT --to-destination $IPROUTER:22 \
###################################################
# Opening Web GUI For Luci in Port 4000 #
###################################################
&& echo "wait for port to open Web GUI Router." \
&& sleep 5 \
&& iptables -t nat -A PREROUTING -p tcp --dport 4000 -d $IPVPS -j DNAT --to-destination $IPROUTER:80 \
&& iptables -t nat -A POSTROUTING -d $IPROUTER -p tcp --dport 80 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 4000 -d $IPVPS -j DNAT --to-destination $IPROUTER:80 \
###################################################
# Setting Firewall PS4 TCP #
###################################################
&& echo "setting TCP Port PS4, please wait" \
&& sleep 2 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 987 -d $IPVPS -j DNAT --to-destination $IPPS:987 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 987 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 987 -d $IPVPS -j DNAT --to-destination $IPPS:987 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 9295 -d $IPVPS -j DNAT --to-destination $IPPS:9295 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 9295 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 9295 -d $IPVPS -j DNAT --to-destination $IPPS:9295 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 9296 -d $IPVPS -j DNAT --to-destination $IPPS:9296 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 9296 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 9296 -d $IPVPS -j DNAT --to-destination $IPPS:9296 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 9297 -d $IPVPS -j DNAT --to-destination $IPPS:9297 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 9297 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 9297 -d $IPVPS -j DNAT --to-destination $IPPS:9297 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 9303 -d $IPVPS -j DNAT --to-destination $IPPS:9303 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 9303 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 9303 -d $IPVPS -j DNAT --to-destination $IPPS:9303 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 9304 -d $IPVPS -j DNAT --to-destination $IPPS:9304 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 9304 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 9304 -d $IPVPS -j DNAT --to-destination $IPPS:9304 \
###################################################
&& iptables -t nat -A PREROUTING -p tcp --dport 8572 -d $IPVPS -j DNAT --to-destination $IPPS:8572 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p tcp --dport 8572 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p tcp --dport 8572 -d $IPVPS -j DNAT --to-destination $IPPS:8572 \
###################################################
&& echo "setting UDP Port PS4, please wait" \
&& sleep 2 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 987 -d $IPVPS -j DNAT --to-destination $IPPS:987 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 987 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 987 -d $IPVPS -j DNAT --to-destination $IPPS:987 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 9295 -d $IPVPS -j DNAT --to-destination $IPPS:9295 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 9295 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9295 -d $IPVPS -j DNAT --to-destination $IPPS:9295 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 9296 -d $IPVPS -j DNAT --to-destination $IPPS:9296 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 9296 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9296 -d $IPVPS -j DNAT --to-destination $IPPS:9296 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 9297 -d $IPVPS -j DNAT --to-destination $IPPS:9297 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 9297 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9297 -d $IPVPS -j DNAT --to-destination $IPPS:9297 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 9303 -d $IPVPS -j DNAT --to-destination $IPPS:9303 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 9303 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9303 -d $IPVPS -j DNAT --to-destination $IPPS:9303 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 9304 -d $IPVPS -j DNAT --to-destination $IPPS:9304 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 9304 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 9304 -d $IPVPS -j DNAT --to-destination $IPPS:9304 \
###################################################
&& iptables -t nat -A PREROUTING -p udp --dport 8572 -d $IPVPS -j DNAT --to-destination $IPPS:8572 \
&& iptables -t nat -A POSTROUTING -d $IPPS -p udp --dport 8572 -j MASQUERADE \
&& iptables -t nat -A OUTPUT -p udp --dport 8572 -d $IPVPS -j DNAT --to-destination $IPPS:8572 \
&& echo "DONE"
