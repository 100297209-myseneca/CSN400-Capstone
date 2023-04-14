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






### Part B-Logging and Analyzing FTP and MySQL Traffic

- #### ***Screenshot of ftp-mysql-filtered.pcap that shows 8 packets:***


### Part C-Adjusting firewalls to DROP and LOG Traffic
- #### ***Two lines updated in the script lr-drop-log.sh:***
```

iptables -A FORWARD -p tcp -s 10.51.94.4/24 -d 172.17.115.32/27 --dport 22 -m state --state NEW -j DROP
```

```

iptables -A FORWARD -p tcp -s 10.51.94.4/24 -d 172.17.115.36 --dport 21 -j DROP
```

- #### ***Screenshot of lr-nondrop-log-filtered.pcap:***





 #### ***lr-drop-log-filtered.log as code snippet with proper syntax:***
 
 
 
 
 
 
  #### ***Screenshot of lr-drop-log-filtered.pcap that shows 2 packets:***




### Part D-Azure Cost Analysis Charts


#### ***Screenshot of resources daily costs for last 7 days***

#### ***Scrrenshot of Service daily costs for last 7 days***

#### ***Screenshot of Resource accumulated costs last 7 days*** 

### ***Screenshot of Service Name last month pie chart***

#### ***Screenshot of Service Family last month pie chart***
 #### ***Screenshot of Product last month pie chart***







