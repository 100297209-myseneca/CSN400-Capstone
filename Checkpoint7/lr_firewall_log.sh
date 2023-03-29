
# Flush All Iptables Chains/Firewall rules
echo "-------------------------------------------"
echo "Flush All Iptables Chains/Firewall rules"
iptables -F

# Delete all Iptables Chains
echo "-------------------------------------------"
echo "Delete all Iptables Chains"
iptables -X

# Allow any INPUT tcp traffic if RELATED or ESTABLISHED
echo "-------------------------------------------"
echo "Allow any INPUT tcp traffic if RELATED or ESTABLISHED"
iptables -A INPUT -p tcp -s 10.67.61.4/24 -d 192.168.118.36 --dport 22 -m limit --limit 10/sec -j LOG --log-prefix "SSH INPUT LR-118 - "
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow icmp traffic into the VM
echo "-------------------------------------------"
echo "Allow icmp traffic into the VM"
iptables -A INPUT -p icmp -j ACCEPT

# Allow any traffic from loopback interface into the VM
echo "-------------------------------------------"
echo "Allow any traffic from loopback interface into the VM"
iptables -A INPUT -i lo -j ACCEPT

# Allow all SSH traffic on port 22 from Source IP subnet student_vnet
echo "-------------------------------------------"
echo "Allow all SSH traffic on port 22 from Source IP subnet student_vnet"
iptables -A INPUT -p tcp -s 10.67.61.4/24 -m state --state NEW --dport 22 -j ACCEPT

# Log before DROPPING
echo "-------------------------------------------"
echo "Add a rule to LOG instead of DROPPING INPUT packets"
iptables -A INPUT -p all -m limit --limit 10/s -j LOG  --log-prefix "TO_DROP_INPUT"

# Reject all other INPUT traffic
# echo "-------------------------------------------"
# echo "Reject all other INPUT traffic"
iptables -A INPUT -j DROP


# Allow forwarding SSH traffic on port 22 from Windows Client to Server SN1
echo "-------------------------------------------"
echo "SSH"
echo "Allow forwarding all SSH traffic on port 22 from any source to any destination"
iptables -A FORWARD -p tcp  -s 10.67.61.4/24 -d 172.17.118.37 --dport 22 -m limit --limit 100/sec -j LOG --log-prefix "SSH FORWARD LS-118 - "
iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.32/27 --dport 22 -j ACCEPT
iptables -A FORWARD -p tcp -s 172.17.118.32/27 -d 10.67.61.4/24 --sport 22 -j ACCEPT


# Allow forwarding RDP traffic on port 3389 from from Windows Client to Server SN1
echo "-------------------------------------------"
echo "RDP"
echo "Allow forwarding all RDP traffic on port 3389 from any source to any destination"
iptables -A FORWARD -p tcp  -s 10.67.61.4/24 -d 172.17.118.36 --dport 3389 -m limit --limit 100/sec -j LOG --log-prefix "RDP FORWARD WS-118 - "
iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.32/27 --dport 3389 -j ACCEPT
iptables -A FORWARD -p tcp -s 172.17.118.32/27 -d 10.67.61.4/24 --sport 3389 -j ACCEPT

# Firewall Settings to allow specific traffic on Router FORWARD chain

echo "-------------------------------------------"
echo "DNS"
echo "allow any tcp and udp traffic pass through Linux router for DNS protocol"
iptables -A FORWARD -p tcp  -s 10.67.61.4/24 -d 172.17.118.36 --dport 53 -m limit --limit 100/sec -j LOG --log-prefix "DNS TCP FORWARD - "
iptables -A FORWARD -p udp  -s 10.67.61.4/24 -d 172.17.118.36 --dport 53 -m limit --limit 100/sec -j LOG --log-prefix "DNS UDP FORWARD - "
iptables -A FORWARD -p tcp -d 172.17.118.36 --dport 53 -j ACCEPT
iptables -A FORWARD -p tcp -s 172.17.118.36 --sport 53 -j ACCEPT
iptables -A FORWARD -p udp -d 172.17.118.36 --dport 53 -j ACCEPT
iptables -A FORWARD -p udp -s 172.17.118.36 --sport 53 -j ACCEPT

echo "-------------------------------------------"
echo "MySQL"
echo "allow any tcp traffic pass through Source WC-118 subnet to Destination LS-118 for destination MySQL protocol"
iptables -A FORWARD -p tcp  -s 10.67.61.4/24 -d 172.17.118.37 --dport 3306 -m limit --limit 100/sec -j LOG --log-prefix "MySQL FORWARD LS-118 - "
iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.37 --dport 3306 -j ACCEPT
echo "allow any tcp traffic pass through Source WS-118 to destination WC-118 subnet for source MySQL protocol"
iptables -A FORWARD -p tcp -d 10.67.61.4/24 -s 172.17.118.37 --sport 3306 -j ACCEPT

echo "-------------------------------------------"
echo "Apache"
echo "allow any tcp traffic pass through Source WC-118 subnet to Destination WS-118 for destination Apache protocol"
iptables -A FORWARD -p tcp  -s 10.67.61.4/24 -d 172.17.118.37 --dport 80 -m limit --limit 100/sec -j LOG --log-prefix "HTTP FORWARD LS-118 - "
iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.37 --dport 80 -j ACCEPT
echo "allow any tcp traffic pass through Source WS-118 to destination WC-118 subnet for source Apache protocol"
iptables -A FORWARD -p tcp -d 10.67.61.4/24 -s 172.17.118.37 --sport 80 -j ACCEPT

echo "-------------------------------------------"
echo "IIS"
echo "allow any tcp traffic pass through Source WC-118 subnet to Destination LR-118 for destination HTTP protocol to access IIS"
iptables -A FORWARD -p tcp  -s 10.67.61.4/24 -d 172.17.118.36 --dport 80 -m limit --limit 100/sec -j LOG --log-prefix "HTTP FORWARD WS-118 - "
iptables -A FORWARD -p tcp -s 10.67.61.4/24 -d 172.17.118.36 --dport 80 -j ACCEPT
echo "allow any tcp traffic pass through Source LS-118 to destination WC-118 subnet for source HTTP protocol to access IIS"
iptables -A FORWARD -p tcp -d 10.67.61.4/24 -s 172.17.118.36 --sport 80 -j ACCEPT
