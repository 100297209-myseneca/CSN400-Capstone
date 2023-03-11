# Checkpoint6 Submission

- **COURSE INFORMATION: CSN400NDD**
- **STUDENT’S NAME: Md Saiful Islam**
- **STUDENT'S NUMBER: 100297209**
- **GITHUB USER ID: 100297209-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A : DevTest Lab VM Configuration](#part-a)
2. [Part B : Linux VMs Firewall Setting](#part-b)
3. [Part C - Enable ip-forwarding in NIC](#part-c)
4. [Part D : Basic Connectivity](#part-d)
5. [Part E : Azure Cost Analysis Charts](#part-d)


### Part A 

![Part A](https://user-images.githubusercontent.com/122843163/224479998-36d9aad7-143d-4614-a6af-14d0d84e0e74.png)
 
### Part B 



### Part C 

***az network nic show -g Student-RG-846407 -n LR-118 --query "enableIpForwarding"***

```
true
```
### Part D 

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

 ### Part E 

 ***1. Screenshot of resources daily costs for last 7 days***
![1](https://user-images.githubusercontent.com/122843163/224480044-37c29cbd-0771-4ab8-b258-99c13bc8c6e9.png)

***2. Scrrenshot of Service daily costs for last 7 days***

![2](https://user-images.githubusercontent.com/122843163/224480089-b51a5452-7537-43e7-86ca-c46a444ddcfb.png)

***3. Screenshot of Resource accumulated costs last 7 days*** 

![3](https://user-images.githubusercontent.com/122843163/224480109-0ba5c6b3-14da-4f67-a514-be49108c3cd4.png)

***4. Screenshot of Service Name last month pie chart***

![4](https://user-images.githubusercontent.com/122843163/224480130-9405067c-5276-49bc-b6ea-84c7f748732f.png)

***5. Screenshot of Service Family last month pie chart***


![5](https://user-images.githubusercontent.com/122843163/224480157-5f28a999-c803-4fbe-a819-8e2859167352.png)


***6. Screenshot of Product last month pie chart***

![6](https://user-images.githubusercontent.com/122843163/224480167-47571681-7e16-4319-89aa-a5e7fb5c727d.png)

