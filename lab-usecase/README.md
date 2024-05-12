

# BRIEF

Répondre aux questions pour chaque flux TCP :
1) calcul du RTT initial
2) quelle est la taille initiale de la fenêtre du recepteur (= RCV Window) ?
3) quelle est la taille maximale de fenêtre du recepteur ? (valeur et numero de paquet)
4) y a-t-il des SACK ? pourquoi ?
) identifier le 1er Fast Retransmit (3 x DUP ACK)
) identifier le 1er RTO
6) calculer le nombre de retransmissions dus à des 3x DUP ACK ou RTO (=2 x RTT) ? Quels numéros de paquets ?
7) estimation des 5 premières CWND (basé sur le Bytes in Flight = BIF, et un séquencement temporel égal au RTT initial)
8) combien de temps dure le Slow Start (=SS)  ?
9) quel est la valeur initiale de SSThres ?


## TACHE 1 : Télécharger la capture l'injecter dans Wireshark.

Voici l'URL (https://ccb-bbr.s3.eu-central-1.amazonaws.com/assignment2.pcap)[https://ccb-bbr.s3.eu-central-1.amazonaws.com/assignment2.pcap]
Sur Linux :
```
wget https://ccb-bbr.s3.eu-central-1.amazonaws.com/assignment2.pcap
```

## TACHE 2 : Identifier la liste des flux

Utiliser ```tcptrace``` est probablement la meilleure option.

## TACHE 3 : Isoler chaque flux dans un pcap

Il est pratique de créer un pcap par flux TCP.
C'est faisable par ```tcpdump``` directement.

Mais, utilisons un outil plus adapté : (Pcap-Splitter)[https://github.com/shramos/pcap-splitter?tab=readme-ov-file] :

Installons d'abord l'outil Pcap-Splitter et ses dépendances
```
wget https://github.com/seladb/PcapPlusPlus/releases/download/v23.09/pcapplusplus-23.09-ubuntu-22.04-gcc-11.2.0-x86_64.tar.gz
tar zxvf pcapplusplus-23.09-ubuntu-22.04-gcc-11.2.0-x86_64.tar.gz 
cd pcapplusplus-23.09-ubuntu-22.04-gcc-11.2.0-x86_64/
cp /bin/* /usr/local/sbin/
mkdir /root/subcaps
```

Puis
```
python
>>> from pcap_splitter.splitter import PcapSplitter
>>>ps = PcapSplitter("./assignment2.pcap")
>>> print(ps.split_by_session("subpcaps", pkts_bpf_filter="tcp"))
Started...
Finished. Read and written 24125 packets to 3 files
>>> exit()
```

On obtient :
```
ls -lh subcaps
total 23M
-rw-r--r-- 1 root root  11M May 11 20:42 assignment2-0001.pcap
-rw-r--r-- 1 root root  11M May 11 20:42 assignment2-0002.pcap
-rw-r--r-- 1 root root 1.1M May 11 20:42 assignment2-0003.pcap
```

## TACHE 4 : Répondre aux questions du BRIEF pour chaque flux

Le menu "Expert" de Wireshark est un bon début.