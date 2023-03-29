# Checkpoint 7 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Md Saiful Islam**
- **STUDENT'S NUMBER: 100297209**
- **GITHUB USER ID: 100297209-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A – Logging Packets with Specific Prefixes](#header1)
2. [Part B - Filtering Logged Packets](#header2)
3. [Part C - Analyzing Logged Packets](#header3)
4. [Part D - Azure Cost Analysis Charts](#haeder4)

### Part A – Logging Packets with Specific Prefixes

***Link to bash script for lr_firewall_log.sh:***
https://github.com/100297209-myseneca/CSN400-Capstone/blob/main/Checkpoint7/lr_firewall_log.sh

***Link to iptables -nvL --line output file (lr_firewalls_log.txt):***
https://github.com/100297209-myseneca/CSN400-Capstone/blob/main/Checkpoint7/lr_firewall_log.txt

```
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1      668 45491 LOG        tcp  --  *      *       10.67.61.0/24        192.168.118.36       tcp dpt:22 limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "SSH INPUT LR-118 - "
2        3   156 ACCEPT     tcp  --  *      *       10.67.61.0/24        0.0.0.0/0            state NEW tcp dpt:22

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1       41  5261 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:22 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "SSH FORWARD LS-118 - "
2       42  5301 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:22
3       37  5329 ACCEPT     tcp  --  *      *       172.17.118.32/27     10.67.61.0/24        tcp spt:22
4      320 12800 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:3389 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "RDP FORWARD WS-118 - "
5      320 12800 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:3389
6      320 29120 ACCEPT     tcp  --  *      *       172.17.118.32/27     10.67.61.0/24        tcp spt:3389
7        0     0 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:53 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "DNS TCP FORWARD - "
8      109  6986 LOG        udp  --  *      *       10.67.61.0/24        172.17.118.36        udp dpt:53 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "DNS UDP FORWARD - "
9        0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            172.17.118.36        tcp dpt:53
10       0     0 ACCEPT     tcp  --  *      *       172.17.118.36        0.0.0.0/0            tcp spt:53
11     123  7870 ACCEPT     udp  --  *      *       0.0.0.0/0            172.17.118.36        udp dpt:53
12     117 17926 ACCEPT     udp  --  *      *       172.17.118.36        0.0.0.0/0            udp spt:53
13      31  2837 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:3306 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "MySQL FORWARD LS-118 - "
14      33  3046 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:3306
15      33 12221 ACCEPT     tcp  --  *      *       172.17.118.37        10.67.61.0/24        tcp spt:3306
16      12  1426 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD LS-118 - "
17      12  1426 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.37        tcp dpt:80
18      10  1067 ACCEPT     tcp  --  *      *       172.17.118.37        10.67.61.0/24        tcp spt:80
19      10   968 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD WS-118 - "
20      10   968 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:80
21      11   796 ACCEPT     tcp  --  *      *       172.17.118.36        10.67.61.0/24        tcp spt:80
22      38  1808 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:21 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "FTP CONTROL PLANE FORWARD WS-"
23      56  2680 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpt:21
24      60  4207 ACCEPT     tcp  --  *      *       172.17.118.36        10.67.61.0/24        tcp spt:21
25      20   872 LOG        tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpts:50000:51000 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-118"
26      24  1032 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.36        tcp dpts:50000:51000
27      21  1649 ACCEPT     tcp  --  *      *       172.17.118.36        10.67.61.0/24        tcp spts:50000:51000

```

### Part B - Filtering Logged Packets

***Link to logged_packets.log file:***
https://github.com/100297209-myseneca/CSN400-Capstone/blob/main/Checkpoint7/logged_packets.log

```
Mar 23 05:42:03 LR-118 kernel: SSH INPUT LR-118 - IN=eth0 OUT= MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=192.168.118.36 LEN=40 TOS=0x00 PREC=0x00 TTL=128 ID=56437 DF PROTO=TCP SPT=64502 DPT=22 WINDOW=2047 RES=0x00 ACK URGP=0

Mar 23 05:45:45 LR-118 kernel: SSH OUTPUT WC-846342 - IN= OUT=eth0 SRC=192.168.118.36 DST=10.67.61.4 LEN=76 TOS=0x08 PREC=0x40 TTL=64 ID=24371 DF PROTO=TCP SPT=22 DPT=64502 WINDOW=296 RES=0x00 ACK PSH URGP=0

Mar 23 06:19:13 LR-118 kernel: SSH FORWARD LS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.37 LEN=76 TOS=0x00 PREC=0x00 TTL=127 ID=31797 DF PROTO=TCP SPT=64519 DPT=22 WINDOW=2052 RES=0x00 ACK PSH URGP=0

Mar 23 06:29:40 LR-118 kernel: RDP FORWARD WS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=54388 DF PROTO=TCP SPT=63970 DPT=3389 WINDOW=2047 RES=0x00 ACK URGP=0

Mar 23 06:29:00 LR-118 kernel: DNS UDP FORWARD - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=71 TOS=0x00 PREC=0x00 TTL=127 ID=54342 PROTO=UDP SPT=50334 DPT=53 LEN=51

Mar 23 06:29:00 LR-118 kernel: DNS UDP FORWARD - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=71 TOS=0x00 PREC=0x00 TTL=127 ID=54342 PROTO=UDP SPT=50334 DPT=53 LEN=51

Mar 23 05:36:10 LR-118 kernel: MySQL FORWARD LS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.37 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=31782 DF PROTO=TCP SPT=64625 DPT=3306 WINDOW=2051 RES=0x00 ACK URGP=0

Mar 23 05:36:25 LR-118 kernel: HTTP FORWARD WS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=41 TOS=0x00 PREC=0x00 TTL=127 ID=50910 DF PROTO=TCP SPT=64578 DPT=80 WINDOW=2051 RES=0x00 ACK URGP=0

Mar 23 05:36:25 LR-118 kernel: HTTP FORWARD WS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=41 TOS=0x00 PREC=0x00 TTL=127 ID=50910 DF PROTO=TCP SPT=64578 DPT=80 WINDOW=2051 RES=0x00 ACK URGP=0

Mar 23 05:37:53 LR-118 kernel: FTP CONTROL PLANE FORWARD WS-IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=51088 DF PROTO=TCP SPT=64665 DPT=21 WINDOW=2050 RES=0x00 ACK URGP=0

Mar 23 05:36:53 LR-118 kernel: FTP DATA PLANE FORWARD WS-118IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=51016 DF PROTO=TCP SPT=64667 DPT=50005 WINDOW=65535 RES=0x00 SYN URGP=0

Mar 23 05:29:23 LR-118 kernel: TO_DROP_FORWARDIN=eth0 OUT=eth0 MAC=00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=39 TOS=0x00 PREC=0x00 TTL=127 ID=50371 PROTO=UDP SPT=55423 DPT=3389 LEN=19

```
### Part C - Analyzing Logged Packets


| Packet ID | Date | MAC Address | Protocol | Source Address | Dest. Address | Source Port | Dest. Port | Packet Length | LOG Prefix | Time To Live |
|-|-|-|-|-|-|-|-|-|-|-|
| 56437 | Mar 23 05:42:03 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00  | TCP | 10.67.61.4 | 192.168.118.36 | 64502 | 22 | 40 | SSH INPUT LR-118   | 128 |
| 24371 | Mar 23 05:45:45 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00  | TCP | 192.168.118.36 | 10.67.61.4  | 22 | 64502 | 76 | SSH OUTPUT WC-846407  | 64 |
| 54342 | Mar 23 03:04:02 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 | UDP | 10.67.61.4 | 172.17.118.36 | 50334 | 53 | 51 | DNS UDP FORWARD  | 127 |
| 50910 | Mar 23 03:08:18 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 | TCP | 10.67.61.4 | 172.17.118.36 | 64578  | 80 | 41 | HTTP FORWARD WS-118  | 127 |
| 54342 | Mar 23 03:09:02 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 | UDP | 10.67.61.4 | 172.17.118.36 | 50334 | 53 | 51 | DNS UDP FORWARD  | 127 |
| 31797 | Mar 23 03:10:22 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 | TCP | 10.67.61.4 | 172.17.118.37 | 64519 | 22 | 76 | SSH FORWARD LS-118  | 127 |
| 31782 | Mar 23 03:11:12 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 | TCP | 10.67.61.4 | 172.17.118.37 | 64625| 3306 | 40 | MySQL FORWARD LS-118  | 127 |
| 51088 | Mar 23 03:16:42 | 00:0d:3a:f4:01:c7:58:97:bd:37:c5:47:08:00 | TCP | 10.67.61.4 | 172.17.118.36 | 64665  | 21 | 40 | FTP CONTROL PLANE FORWARD WS-118  | 127 |


### Part D - Azure Cost Analysis Charts
***1. Screenshot of resources daily costs for last 7 days***

![1](https://user-images.githubusercontent.com/122843163/228472459-67cb43b1-a94a-4c9a-a5c9-ed794d821487.png)

***2. Screenshot of Service daily costs for last 7 days***

![2](https://user-images.githubusercontent.com/122843163/228472570-cc2f5a38-d40d-47aa-8e9a-d7dcc592a25f.png)

***3. Screenshot of Resource accumulated costs last 7 days*** 

![3](https://user-images.githubusercontent.com/122843163/228472613-4dc8bb0f-eb42-4acf-a173-2a62eb077678.png)

***4. Screenshot of Service Name last month pie chart***

![4](https://user-images.githubusercontent.com/122843163/228472660-202aeeb3-2ed6-4f2e-adf4-b4ace5740759.png)

***5. Screenshot of Service Family last month pie chart***

![5](https://user-images.githubusercontent.com/122843163/228472680-b7bf9548-9218-4489-a5c5-6bcc785d4cb5.png)

***6. Screenshot of Product last month pie chart***

![6](https://user-images.githubusercontent.com/122843163/228472710-08b7c6d2-63eb-4d74-9d60-acf5edcbaeec.png)




