#!/bin/bash
systemctl restart iptables
iptables -t nat -F
iptables -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t filter -A FORWARD -i eth0 -o wlan0 -j ACCEPT
iptables -t filter -A FORWARD -i wlan0 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -j LOG --log-level debug
iptables -t filter -A FORWARD -j LOG  --log-level debug
iptables --list -t nat