Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1        8   416 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:18118 to:172.17.118.37:80
2       14   736 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:16118 to:172.17.118.37:3306
3       10   576 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:12118 to:172.17.118.37:22
4        7   372 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:19118 to:172.17.118.36:80
5        8   440 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:13118 to:172.17.118.36:3389

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1     3975  241K MASQUERADE  all  --  *      eth0    0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
