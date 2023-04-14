# Checkpoint8 Submission
---

- **COURSE INFORMATION: CSN400**
- **STUDENT’S NAME: Md Saiful Islam**
- **STUDENT'S NUMBER: 100297209**
- **GITHUB USER ID: 100297209-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

---

---

1. [Part A - Logging and Analyzing DNS and HTTP Traffic](#part-a-logging-and-analyzing-dns-and-http-traffic)
2. [Part B - Logging and Analyzing FTP and MySQL Traffic](#part-b-logging-and-analyzing-ftp-and-mysql-traffic)
3. [Part C - Adjusting firewalls to DROP and LOG Traffic](#part-c-adjusting-firewalls-to-drop-and-log-traffic)
4. [Part D - Azure Cost Analysis Charts](#part-d-azure-cost-analysis-charts)

---

### Part A-Logging and Analyzing DNS and HTTP Traffic

- #### ***Screenshot of apache-iis-filtered.pcap that shows 8 packets:***

![apache-iis-filtered pcap](https://user-images.githubusercontent.com/122843163/231952287-207096da-d813-4d2f-b9bd-78d20fb2eb93.png)


### Part B-Logging and Analyzing FTP and MySQL Traffic

- #### ***Screenshot of ftp-mysql-filtered.pcap that shows 8 packets:***

![ftp-mysql-filtered pcap ](https://user-images.githubusercontent.com/122843163/231952356-d48d60b1-d728-4e1b-aacc-7909572fe427.png)


### Part C-Adjusting firewalls to DROP and LOG Traffic

- #### ***Two lines updated in the script lr-drop-log.sh:***

```
iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.32/27 --dport 22 -m state --state NEW -j DROP


iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.36 --dport 21 -j DROP
```

- #### ***Screenshot of lr-nondrop-log-filtered.pcap:***

![lr-nondrop-log-filtered pcap](https://user-images.githubusercontent.com/122843163/231952402-c4b6abbe-4875-4b69-b9a8-a772e90bfa33.png)



- #### ***lr-drop-log-filtered.log as code snippet with proper syntax:***
 ```
 Apr 12 07:40:44 LR-118 kernel: SSH DROP FORWARD LS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:e6:fd:04:62:73:58:1b:ef:08:00 SRC=10.67.61.4 DST=172.17.118.37 LEN=76 TOS=0x00 PREC=0x00 TTL=127 ID=26598 DF PROTO=TCP SPT=59524 DPT=22 WINDOW=2049 RES=0x00 ACK PSH URGP=0

Apr 12 07:35:07 LR-118 kernel: SSH DROP FORWARD LS-118 - IN=eth0 OUT=eth0 MAC=00:0d:3a:f4:e6:fd:04:62:73:58:1b:ef:08:00 SRC=10.67.61.4 DST=172.17.118.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=26590 DF PROTO=TCP SPT=63274 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0

```

 

 - #### ***Screenshot of lr-drop-log-filtered.pcap that shows 2 packets:***
  
   ![lr-drop-log-filtered pcap](https://user-images.githubusercontent.com/122843163/231952427-fc1ad65e-86aa-4863-8ff4-417ae9865742.png)




### Part D-Azure Cost Analysis Charts


#### ***Screenshot of resources daily costs for last 7 days***

#### ***Scrrenshot of Service daily costs for last 7 days***

#### ***Screenshot of Resource accumulated costs last 7 days*** 

### ***Screenshot of Service Name last month pie chart***

#### ***Screenshot of Service Family last month pie chart***
 #### ***Screenshot of Product last month pie chart***







