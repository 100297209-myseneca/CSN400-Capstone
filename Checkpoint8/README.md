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

![1](https://user-images.githubusercontent.com/122843163/232655826-8c1cbda2-1fc0-4fcb-abfe-493c3c9e0cf1.png)

#### ***Scrrenshot of Service daily costs for last 7 days***
![2](https://user-images.githubusercontent.com/122843163/232655848-933e6167-35f0-4be8-93b1-c975f2b5324c.png)

#### ***Screenshot of Resource accumulated costs last 7 days*** 
![3](https://user-images.githubusercontent.com/122843163/232655862-af5edb9c-1758-4bd2-988a-3053a0cf22a1.png)

### ***Screenshot of Service Name last month pie chart***
![4](https://user-images.githubusercontent.com/122843163/232655927-07e32b66-cdfc-4485-9b38-b44e41e41f2e.png)



#### ***Screenshot of Service Family last month pie chart***
![5](https://user-images.githubusercontent.com/122843163/232655944-f9ba83c7-df5f-4dde-a670-5afdd5fbc50d.png)


 #### ***Screenshot of Product last month pie chart***
 
![6](https://user-images.githubusercontent.com/122843163/232656004-daa91d0c-83bc-4184-8bfc-1cf0a595242e.png)







