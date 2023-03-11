# Checkpoint6 Submission

- **COURSE INFORMATION: CSN400NDD**
- **STUDENT’S NAME: Md Saiful Islam**
- **STUDENT'S NUMBER: 100297209**
- **GITHUB USER ID: 100297209-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A - DevTest Lab VM Configuration](#header1)
2. [Part B - Linux VMs Firewall Setting](#header2)
3. [Part C - Enable ip-forwarding in NIC](#header4)
4. [Part D - Basic Connectivity](#header3)
5. [Part E - Azure Cost Analysis Charts](#header4)


Part A - DevTest Lab VM Configuration
 
Part B - Linux VMs Firewall Setting



Part C - Enable ip-forwarding in NIC

***az network nic show -g Student-RG-846407 -n LR-118 --query "enableIpForwarding"***

```
true
```
Part D - Basic Connectivity

```
[msislam40@LR-118 ~]$ Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
37266 8759K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    3   344 ACCEPT     tcp  --  *      *       10.67.61.0/24        0.0.0.0/0            state NEW tcp dpt:22
  181 22026 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
  181 22026 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 2139  143K ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:22
 1318  159K ACCEPT     tcp  --  *      *       172.17.118.32/27     10.67.61.0/24        tcp spt:22
    5   260 ACCEPT     tcp  --  *      *       10.67.61.0/24        172.17.118.32/27     tcp dpt:3389
    0     0 ACCEPT     tcp  --  *      *       172.17.118.32/27     10.67.61.0/24        tcp spt:3389
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
50057   14M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```
```
[msislam40@LS-119 ~]$ Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
31530 7361K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       192.168.118.32/27    0.0.0.0/0            tcp dpt:22
    1    52 ACCEPT     tcp  --  *      *       10.67.61.0/24        0.0.0.0/0            tcp dpt:22
  206 27213 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
  206 27213 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
42179   11M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```
