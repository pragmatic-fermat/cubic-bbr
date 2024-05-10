
D'abord listez les conversations TCP du pcap X avec ```tshark``` (lent)

```tshark -r assignment2.pcap -q -z conv,tcp```

Ensuite, on peut isoler chaque conversation tcp dans un fichier avec l'outil [tcpflow](https://github.com/simsong/tcpflow) 

```
# tcpflow -r assignment2.pcap 
reportfilename: ./report.xml
# ls -lh
[..]
-rw-r--r--  1 root    root    9.7M Feb 17  2017 130.245.145.012.43498-128.208.002.198.00080
-rw-r--r--  1 root    root    9.7M Feb 17  2017 130.245.145.012.43500-128.208.002.198.00080
-rw-r--r--  1 root    root    1.1M Feb 17  2017 130.245.145.012.43502-128.208.002.198.00080
```

Puis, utilisez le script ```bytes-in-flight.sh``` pour analyser la connexions souhaitée (attention à bien préciser le principal emetteur en premier dans les arguments de ```bytes-in-flight.sh``` , c-a-d celui dont on veut étudier l'algorithme de controle de congestion

```
bytes-in-flight.sh ./assignment2.pcap 130.245.145.12 43498 128.208.2.198 80 bif.txt
```

Le contenu di fichier bif.txt ressemble à ceci :
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

avec :

PS : ces scripts sont extraits de :
- [https://github.com/noahdavids/packet-analysis.git](https://github.com/noahdavids/packet-analysis.git)
- [https://github.com/pkpraveen895/pcap-analyser.git](https://github.com/pkpraveen895/pcap-analyser.git)
