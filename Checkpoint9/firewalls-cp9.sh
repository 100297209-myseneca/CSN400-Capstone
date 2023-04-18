Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1      818 49725 LOG        tcp  --  *      *       10.67.61.0/24        192.168.118.36       tcp dpt:22 limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "SSH INPUT LR-118 - "
2    12426 2770K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
3        0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
4        3   180 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
5        1    52 ACCEPT     tcp  --  *      *       10.67.61.0/24        0.0.0.0/0            state NEW tcp dpt:22
6      108 18740 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
7      108 18740 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1       38  2604 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:22 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "SSH DROP FORWARD LS-118 - "
2        0     0 DROP       tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:22 state NEW
3       38  2604 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:22
4       60  5696 ACCEPT     tcp  --  *      *       172.17.118.32/27     10.67.61.0/24        tcp spt:22
5      667 96615 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:3389 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "RDP FORWARD WS-118 - "
6      950  241K ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:3389
7     1025  491K ACCEPT     tcp  --  *      *       172.17.118.32/27     10.67.61.0/24        tcp spt:3389
8        0     0 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:53 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "DNS TCP FORWARD - "
9      271 17827 LOG        udp  --  *      *       10.67.61.0/24        172.17.118.36        udp dpt:53 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "DNS UDP FORWARD - "
10       0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            172.17.118.36        tcp dpt:53
11       0     0 ACCEPT     tcp  --  *      *       172.17.118.36        0.0.0.0/0            tcp spt:53
12     300 19647 ACCEPT     udp  --  *      *       0.0.0.0/0            172.17.118.36        udp dpt:53
13     289 46959 ACCEPT     udp  --  *      *       172.17.118.36        0.0.0.0/0            udp spt:53
14      36  3183 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:3306 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "MySQL FORWARD LS-118 - "
15      48  4500 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:3306
16      44 22814 ACCEPT     tcp  --  *      *       172.17.118.37        10.67.61.0/24        tcp spt:3306
17      29  6118 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD LS-118 - "
18      29  6118 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:80
19      20  3441 ACCEPT     tcp  --  *      *       172.17.118.37        10.67.61.0/24        tcp spt:80
20      16  2932 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD WS-118 - "
21      16  2932 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:80
22      16  1848 ACCEPT     tcp  --  *      *       172.17.118.36        10.67.61.0/24        tcp spt:80
23      10   520 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:21 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "FTP DROP CONTROL PLANE WS-118"
24      10   520 DROP       tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:21
25       0     0 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:21
26       0     0 ACCEPT     tcp  --  *      *       172.17.118.36        10.67.61.0/24        tcp spt:21
27       0     0 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpts:50000:51000 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-118"
28       0     0 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpts:50000:51000
29       0     0 ACCEPT     tcp  --  *      *       172.17.118.36        10.67.61.0/24        tcp spts:50000:51000
30     130 32700 LOG        tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:18119 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "log-caps-masquerading"
31     130 32700 ACCEPT     tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:18119
32      81 13804 ACCEPT     tcp  --  *      *       192.168.119.36       10.67.61.0/24        tcp spt:18119
33      49  4197 LOG        tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:16119 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "log-caps-masquerading"
34      75  7080 ACCEPT     tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:16119
35      69 34524 ACCEPT     tcp  --  *      *       192.168.119.36       10.67.61.0/24        tcp spt:16119
36      79 17735 LOG        tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:19119 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "log-caps-masquerading"
37      79 17735 ACCEPT     tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:19119
38      77 11729 ACCEPT     tcp  --  *      *       192.168.119.36       10.67.61.0/24        tcp spt:19119
39    1755  149K LOG        tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:13119 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "log-caps-masquerading"
40    2155  307K ACCEPT     tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:13119
41    2179  541K ACCEPT     tcp  --  *      *       192.168.119.36       10.67.61.0/24        tcp spt:13119
42     148 17688 LOG        tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:12119 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "log-caps-masquerading"
43     148 17688 ACCEPT     tcp  --  *      *       10.67.61.0/24        192.168.119.36       tcp dpt:12119
44     124 19924 ACCEPT     tcp  --  *      *       192.168.119.36       10.67.61.0/24        tcp spt:12119
45     226 57420 LOG        tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "NAT-log-http-masquerading"
46     228 57500 ACCEPT     tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:80
47     176 30077 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.119.36       tcp spt:80
48     121 15892 LOG        tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:22 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "NAT-log-ssh-masquerading"
49     123 15972 ACCEPT     tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:22
50     101 15710 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.119.36       tcp spt:22
51     642 77782 LOG        tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:3389 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "NAT-log-rdp-masquerading"
52     890  163K ACCEPT     tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:3389
53    1091  410K ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.119.36       tcp spt:3389
54      95  8180 LOG        tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:3306 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "NAT-log-mysql-masquerading"
55     120 10836 ACCEPT     tcp  --  *      *       192.168.119.36       0.0.0.0/0            tcp dpt:3306
56     124 38437 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.119.36       tcp spt:3306
57      12 15120 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0
