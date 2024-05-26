

# BRIEF

Répondre aux questions pour chaque flux TCP :

1) calcul du RTT initial
2) quelle est la taille initiale de la fenêtre du recepteur (= **rwnd** ) ?
3) quelle est la taille maximale de **rwnd** ? (valeur et numero de paquet)
4) y a-t-il des **SACK** ? pourquoi ?
5) identifier le 1er **Fast Retransmit** (3 x DUP ACK) (numero de paquet)
6) identifier le 1er **RTO** (numero de paquet)
7) calculer le nombre de retransmissions dues à des 3x **DUP ACK** ou RTO (=2 x RTT) ? Quels numéros de paquets ?
8) estimation des 3 premières **cwnd** (basé sur le Bytes in Flight = **BIF**, et un séquencement temporel égal au RTT initial)
9) combien de temps dure le **Slow Start** (=SS)  ?
10) quelle est la valeur initiale de **SSThres** ?

Les taches décrites plus bas permettent d'avancer...

## TACHE 1 : Télécharger la capture l'injecter dans Wireshark.

Voici (le lien vers la capture globale)[https://ccb-bbr.s3.eu-central-1.amazonaws.com/assignment2.pcap]

Sur Linux :
```
wget https://ccb-bbr.s3.eu-central-1.amazonaws.com/assignment2.pcap
```

## TACHE 2 : Identifier la liste des flux

Utiliser ```tcptrace``` est probablement la meilleure option.

Si les outils ne sont pas présents sur votre machine Linux (Ubuntu) :
```
apt update 
apt install -y tcpdump tshark tcptrace python3 libpcap-dev
```

## TACHE 3 : Isoler chaque flux dans un pcap

Il est pratique de créer un pcap par flux TCP.
C'est faisable par **tcpdump** directement (ou de nombreux autres outils, tels que PcapSplitter en python...)

Nous l'avons fait pour vous :
- [Conv1](https://ccb-bbr.s3.eu-central-1.amazonaws.com/subpcaps/assignment2-0001.pcap)
- [Conv2](https://ccb-bbr.s3.eu-central-1.amazonaws.com/subpcaps/assignment2-0002.pcap)
- [Conv3](https://ccb-bbr.s3.eu-central-1.amazonaws.com/subpcaps/assignment2-0003.pcap)



## TACHE 4 : Répondre aux questions du BRIEF pour chaque flux

Le menu "Expert" de Wireshark est un bon début.