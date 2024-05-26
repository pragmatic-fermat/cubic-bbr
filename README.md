# cubic-bbr

Voici l'enchainement des idées dans ces labs successifs :

- Analyser une capture

- Mettre en place un Lab avec un lien engorgé configurable

- Lancer des transferts en RENO/CUBIC/BBR au travers de ce lien engorgé et constater avec Wireshark les différences (RTT, SS, CWND, Fast Retransmit..)

- Grapher les CWND de transfert RENO/CUBIC/BBR en se basant sur les données systèmes de l'emetteur

- Analyser "à la main" (i.e Wireshark) d'une connexion sur la base d'un pcap , établir les caractéristiques (RTO,3DUP,SS,CWND) , deviner le CCA

- Utiliser des scripts d'analyse afin d'industrialiser la démarche , prendre conscience de la complexité de la tâche