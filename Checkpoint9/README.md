# Checkpoint 9 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Md Saiful Islam**
- **STUDENT'S NUMBER: 100297209**
- **GITHUB USER ID: 100297209-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A – Route Table Updates](#header1)
2. [Part B – Port Forwarding Basic Connectivity](#header2)
3. [Part C – Logging & Isolating Masqueraded Packets](#header3)
4. [Part D - Azure Cost Analysis Charts](#haeder4)

### Part A – Route Table Updates
---
Command I used to make this table: ***az network route-table route show --name "External-Router" --route-table-name "RT-118" --resource-group "Student-RG-846407" --query "{id:id, addressPrefix:addressPrefix, nextHopType:nextHopType, nextHopIpAddress:nextHopIpAddress}" --output table > RT-118-details***
```
cat RT-118-details 
AddressPrefix     NextHopType       NextHopIpAddress
----------------  ----------------  ------------------
192.168.119.32/27  VirtualAppliance  192.168.118.36
```
---
Command I used to make this table: ***az network route-table route show --name "Route-to-Hub" --route-table-name "RT-EX-118" --resource-group "Student-RG-846407" --query "{id:id, addressPrefix:addressPrefix, nextHopType:nextHopType, nextHopIpAddress:nextHopIpAddress}" --output table > RT-EX-118-details***
```
cat RT-EX-118-details 
AddressPrefix     NextHopType       NextHopIpAddress
----------------  ----------------  ------------------
192.168.119.32/27  VirtualAppliance  192.168.99.36
```
--- 
Command I used to make this table: ***az network route-table show --name RT-EX-118 --resource-group "Student-RG-846407" --query "subnets[].id" --output table > RT-EX-118-Subnet***
```
cat RT-EX-118-Subnet 
Result
-------------------------------------------------------------------------------------------------------------------------------------------------------
/subscriptions/e22a2bd0-d760-4866-9918-1c98f501ec8aa/resourceGroups/Student-RG-846407/providers/Microsoft.Network/virtualNetworks/Router-118/subnets/SN1
```

### Part B – Port Forwarding Basic Connectivity
---
**My nat_basic-connectivity.sh script:**
```
# to flush NAT tables
iptables -t nat -F

# to allow other students to access APACHE server 
iptables -t nat -A PREROUTING -p tcp --dport 18118 -j DNAT --to-destination 172.17.118.37:80

# to allow other students to access MySQL server 
iptables -t nat -A PREROUTING -p tcp --dport 16118 -j DNAT --to-destination 172.17.118.37:3306

# to allow other students to access Linux server - SSH 
iptables -t nat -A PREROUTING -p tcp --dport 12118 -j DNAT --to-destination 172.17.118.37:22

# to allow other students to access IIS server 
iptables -t nat -A PREROUTING -p tcp --dport 19118 -j DNAT --to-destination 172.17.118.36:80

# to allow other students to access Windows server - RDP 
iptables -t nat -A PREROUTING -p tcp --dport 13118 -j DNAT --to-destination 172.17.118.36:3389

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# check NAT configuration
iptables -t nat -nvL --line
```
### Part C – Logging & Isolating Masqueraded Packets
---

**Logged packets in masqueraded-logged.log with proper syntax:**
```
Apr 15 06:19:01 LR-118 kernel: NAT-log-http-masqueradingIN=eth0 OUT=eth0 MAC=00:22:48:6d:b2:ff:ec:bd:1d:ea:9a:1d:08:00 SRC=192.168.119.36 DST=172.17.118.37 LEN=594 TOS=0x00 PREC=0x00 TTL=125 ID=5838 DF PROTO=TCP SPT=65203 DPT=80 WINDOW=2049 RES=0x00 ACK PSH URGP=0
Apr 15 06:20:17 LR-118 kernel: NAT-log-http-masqueradingIN=eth0 OUT=eth0 MAC=00:22:48:6d:b2:ff:ec:bd:1d:ea:9a:1d:08:00 SRC=192.168.119.36 DST=172.17.118.36 LEN=41 TOS=0x00 PREC=0x00 TTL=125 ID=5884 DF PROTO=TCP SPT=65202 DPT=80 WINDOW=2050 RES=0x00 ACK URGP=0
Apr 15 06:20:57 LR-118 kernel: NAT-log-mysql-masqueradingIN=eth0 OUT=eth0 MAC=00:22:48:6d:b2:ff:ec:bd:1d:ea:9a:1d:08:00 SRC=192.168.119.36 DST=172.17.118.37 LEN=60 TOS=0x00 PREC=0x00 TTL=125 ID=5890 DF PROTO=TCP SPT=65267 DPT=3306 WINDOW=2049 RES=0x00 ACK PSH URGP=0
Apr 15 06:23:13 LR-118 kernel: NAT-log-rdp-masqueradingIN=eth0 OUT=eth0 MAC=00:22:48:6d:b2:ff:ec:bd:1d:ea:9a:1d:08:00 SRC=192.168.119.36 DST=172.17.118.36 LEN=104 TOS=0x00 PREC=0x00 TTL=125 ID=6242 DF PROTO=TCP SPT=65344 DPT=3389 WINDOW=2046 RES=0x00 ACK PSH URGP=0
Apr 15 06:19:31 LR-118 kernel: NAT-log-ssh-masqueradingIN=eth0 OUT=eth0 MAC=00:22:48:6d:b2:ff:ec:bd:1d:ea:9a:1d:08:00 SRC=192.168.119.36 DST=172.17.118.37 LEN=100 TOS=0x00 PREC=0x00 TTL=125 ID=5878 DF PROTO=TCP SPT=65222 DPT=22 WINDOW=2046 RES=0x00 ACK PSH URGP=0
```
### Part D - Azure Cost Analysis Charts

***1. Screenshot of resources daily costs for last 7 days***

***2. Scrrenshot of Service daily costs for last 7 days***

***3. Screenshot of Resource accumulated costs last 7 days*** 

***4. Screenshot of Service Name last month pie chart***

***5. Screenshot of Service Family last month pie chart***

***6. Screenshot of Product last month pie chart***


