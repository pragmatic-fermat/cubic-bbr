

Ce script permet notammnet d'analyser un pcap pour calculer :
- liste des flow TCP
- numéro de SEQ et d'ACL initiaux
- débit de l'émetteur
- estimation des premières CWND basé sur le nombre de paquets envoyés lors d'un RTT
- nombre de retransmissions dus à des 3 DUP ou RTO (=2 x RTT)

```
python3 ./analysis_pcap_tcp.py toto.pcap
```
Le résultat
```
Number of TCP flows initiated from the sender: 3

Flow 1:
  Source IP: 130.245.145.12, Source Port: 43498 -> Destination IP: 128.208.2.198, Destination Port: 80
  Transaction 1: Seq Num: 705669103, Ack Num: 1921750144, Rec Win Size: 49152
  Transaction 2: Seq Num: 705669127, Ack Num: 1921750144, Rec Win Size: 49152
  Sender Throughput: 41 Mbps
  == (10320184 bytes sent in 2.0104010105133057 seconds)
  First 5 Congestion Window Sizes: [13, 20, 43, 6877]
  Retransmissions due to Triple Duplicate ACKs: 2
  Retransmissions due to Timeouts: 1

Flow 2:
  Source IP: 130.245.145.12, Source Port: 43500 -> Destination IP: 128.208.2.198, Destination Port: 80
  Transaction 1: Seq Num: 3636173852, Ack Num: 2335809728, Rec Win Size: 49152
  Transaction 2: Seq Num: 3636173876, Ack Num: 2335809728, Rec Win Size: 49152
  Sender Throughput: 10 Mbps
  == (10454864 bytes sent in 8.320369958877563 seconds)
  First 5 Congestion Window Sizes: [11, 22, 33, 6925]
  Retransmissions due to Triple Duplicate ACKs: 4
  Retransmissions due to Timeouts: 90

Flow 3:
  Source IP: 130.245.145.12, Source Port: 43502 -> Destination IP: 128.208.2.198, Destination Port: 80
  Transaction 1: Seq Num: 2558634630, Ack Num: 3429921723, Rec Win Size: 49152
  Transaction 2: Seq Num: 2558634654, Ack Num: 3429921723, Rec Win Size: 49152
  Sender Throughput: 11 Mbps
  == (1071936 bytes sent in 0.7402749061584473 seconds)
  First 5 Congestion Window Sizes: [21, 43, 63, 597]
  Retransmissions due to Triple Duplicate ACKs: 0
  Retransmissions due to Timeouts: 0
```

---
Basé sur (https://github.com/dane-meister/TCP-Flow-Analyzer/)[https://github.com/dane-meister/TCP-Flow-Analyzer/]