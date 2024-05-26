
# Introduction

Ce script (crédité plus bas) permet notamment d'analyser un pcap pour calculer :
- liste des flow TCP (le **3 way handshake** doit être capturé)
- numéro de SEQ et d'ACL initiaux
- débit de l'émetteur (basé sur les données capturées, donc un snap len à 96 va fausser ce résultat)
- estimation des 5 premières **cwnd** basé sur le nombre de paquets envoyés lors d'un RTT
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
  First 5 Congestion Window Sizes: [13, 20, 43, 50, 70]
  Retransmissions due to Triple Duplicate ACKs: 2
  Retransmissions due to Timeouts: 1

Flow 2:
  Source IP: 130.245.145.12, Source Port: 43500 -> Destination IP: 128.208.2.198, Destination Port: 80
  Transaction 1: Seq Num: 3636173852, Ack Num: 2335809728, Rec Win Size: 49152
  Transaction 2: Seq Num: 3636173876, Ack Num: 2335809728, Rec Win Size: 49152
  Sender Throughput: 10 Mbps
  == (10454864 bytes sent in 8.320369958877563 seconds)
  First 5 Congestion Window Sizes: [11, 22, 33, 47, 63]
  Retransmissions due to Triple Duplicate ACKs: 4
  Retransmissions due to Timeouts: 90

Flow 3:
  Source IP: 130.245.145.12, Source Port: 43502 -> Destination IP: 128.208.2.198, Destination Port: 80
  Transaction 1: Seq Num: 2558634630, Ack Num: 3429921723, Rec Win Size: 49152
  Transaction 2: Seq Num: 2558634654, Ack Num: 3429921723, Rec Win Size: 49152
  Sender Throughput: 11 Mbps
  == (1071936 bytes sent in 0.7402749061584473 seconds)
  First 5 Congestion Window Sizes: [21, 43, 63, 94, 91]
  Retransmissions due to Triple Duplicate ACKs: 0
  Retransmissions due to Timeouts: 0
```

# Tâches

## Obtenir 3 pcap pour 3 CCA différents 

Par exemple, on lance un capure en backgroung (*&*) :

```
tcpdump -n -s 96 -w iperf-sfo-cubic.pcap "ip host @IP" &
```

Puis on lance un **iperf** en précisant le CCA :
```
iperf3 -c 147.182.236.95 -C ** reno/cubic/bbr **
```

Enfon, on "tue" le tcpdump qui tournait :
```
killall tcpdump
```

PS:  **tshark** a une option de durée (en sec)  : ```tshark -a duration:600```


## Puis lancer l'analyse et voir si elle concluante :

Par exemple, en utilisant le script attaché 
- par ```git clone https://github.com/pragmatic-fermat/cubic-bbr.git```
- ou téléchargement direct (lien)[https://raw.githubusercontent.com/pragmatic-fermat/cubic-bbr/main/lab-flowanalyzer/analysis_pcap_tcp.py]

Lancer l'analyse :
 ```
python analysis_pcap_tcp.py iperf-sfo-cubic.pcap
 ```

## Vérification manuelle de la credibilité

Vérifier à la main dans Wireshark que ces valeurs sont exactes :
- nb de 2 DUP ACK
- nb de RTO
- CWND (hypothèse  = BIF)

  
PS : l'outil (surtout la librairie ```dpkt```) ne supporte que le format ```pcap``` et pas ```pcapng```.
Pour effectuer une conversion :
```
editcap -F libpcap -T ether test.pcapng test.pcap
```

---
Basé sur (https://github.com/dane-meister/TCP-Flow-Analyzer/)[https://github.com/dane-meister/TCP-Flow-Analyzer/]
