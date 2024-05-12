# Introduction

"Bytes in Flight" (BIF) est une approximation de CWND (en l'asbence d'informations coté émetteur)

# Tâches 

D'abord listez les conversations TCP du pcap X avec ```tshark``` (lent)

```tshark -r assignment2.pcap -q -z conv,tcp```


Puis, utilisez le script ```bytes-in-flight.sh``` pour analyser la connexions souhaitée (attention à bien préciser le principal emetteur en premier dans les arguments de ```bytes-in-flight.sh``` , c-a-d celui dont on veut étudier l'algorithme de controle de congestion

```
bytes-in-flight.sh ./assignment2.pcap 130.245.145.12 43498 128.208.2.198 80 bif.txt
```

Le contenu du fichier bif.txt ressemble à ceci :
```
2.004151000   10092569  -  10072313  = BIF:  20256      1638400  Avail-Window:  1618144   21187
2.004154000   10092569  -  10075209  = BIF:  17360      1638400  Avail-Window:  1621040   21188
2.004158000   10092569  -  10078105  = BIF:  14464      1638400  Avail-Window:  1623936   21189
```
avec les colonnes signifiant :
- reltime
- sendersequence
- acksequence
- BIF: sendersequence - acksequence
- lastwindow
- Avail-Window: lastwindow - (sendersequence - acksequence)
- framenumber

Pour analyser le début et la fin :
```
 (head -10 bif.txt; echo . . . . . ; tail -10 bif.txt) | column -t
0.073053000  1        -  0       =  BIF:  1       0       Avail-Window:  -1      4
0.073118000  25       -  0       =  BIF:  25      0       Avail-Window:  -25     5
0.073459000  1473     -  0       =  BIF:  1473    0       Avail-Window:  -1473   11
0.073471000  2921     -  0       =  BIF:  2921    0       Avail-Window:  -2921   12
0.073668000  4369     -  0       =  BIF:  4369    0       Avail-Window:  -4369   17
0.073671000  5817     -  0       =  BIF:  5817    0       Avail-Window:  -5817   18
0.073724000  7265     -  0       =  BIF:  7265    0       Avail-Window:  -7265   19
0.073728000  8713     -  0       =  BIF:  8713    0       Avail-Window:  -8713   20
0.073857000  10161    -  0       =  BIF:  10161   0       Avail-Window:  -10161  24
.            .        .  .       .                                               
0.671908000  1197521  -  883305  =  BIF:  314216  393216  Avail-Window:  79000   2418
0.671911000  1198969  -  883305  =  BIF:  315664  393216  Avail-Window:  77552   2419
0.672223000  1200417  -  883305  =  BIF:  317112  393216  Avail-Window:  76104   2428
0.672225000  1201865  -  883305  =  BIF:  318560  393216  Avail-Window:  74656   2429
0.672228000  1203313  -  883305  =  BIF:  320008  393216  Avail-Window:  73208   2430
0.672231000  1204761  -  883305  =  BIF:  321456  393216  Avail-Window:  71760   2431
0.672507000  1206209  -  883305  =  BIF:  322904  393216  Avail-Window:  70312   2432
0.672511000  1207657  -  883305  =  BIF:  324352  393216  Avail-Window:  68864   2433
0.672513000  1209105  -  883305  =  BIF:  325800  393216  Avail-Window:  67416   2434
0.672516000  1210553  -  883305  =  BIF:  327248  393216  Avail-Window:  65968   2435
```

Analysez les 20/30 ères lignes pour observer le slow start, le RTT...

Idéalement il nous faudrait des retsransmissions (RTO ou 3 Dup ACKs), cherchons-les :
```
# ./packet-analysis/find-retran-failures.sh ./assignment2.pcap "tcp.srcport==80"
current stream:0, 1, 2, 
No TCP connections appear to have failed due of retransmissions
```

---

PS : ces scripts sont extraits de :
- [https://github.com/noahdavids/packet-analysis.git](https://github.com/noahdavids/packet-analysis.git)
