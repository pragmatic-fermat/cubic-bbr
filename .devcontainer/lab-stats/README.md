

Lister les conversations :

tshark -q -z conv,tcp -n -r assignment2.pcap 

En choisir une et construire un filtre (par ex "tcp.scrport==80 and tcp.dstport==43500)

tcpdump -n -r assignment2.pcap -w tcp-43500.pcap "tcp port 43500"

Travaillons maintenant sur tcp-43500.pcap :

Printing relative time of each frame with the ACK_RTT as columns, e.g.

tcpdump -n -r assignment2.pcap -w tcp-43500.pcap "tcp port 43500" 

tshark -r  tcp-43500.pcap -T fields -e tcp.analysis.ack_rtt >> desta-rtt.txt #calculate sample RTT from the command line


---
PS : ce Lab est inspiré de (https://github.com/desta161921/TCP-Protocol-Related/tree/master/scripts)[https://github.com/desta161921/TCP-Protocol-Related/tree/master/scripts]