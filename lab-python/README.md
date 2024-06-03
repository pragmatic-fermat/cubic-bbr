# Construction de la suite de **cwnd** avec python

Ce script a été construit autour du pcap [assignment2.pcap](https://ccb-bbr.s3.eu-central-1.amazonaws.com/assignment2.pcap) afin de répondre aux questions suivantes :

Questions :

a) compter le nombre de flux TCP initiés par l'expéditeur

b) Pour chaque flux TCP 
   - Pour les deux premières transactions après l'établissement de la connexion TCP (de l'expéditeur au destinataire), obtenez les valeurs du numéro de séquence, du numéro d'acquittement et de la taille de la fenêtre de réception. Expliquez ces valeurs.
   - Calculez le débit des données envoyées de la source à la destination. Pour estimer le débit, comptez toutes les données et les en-têtes. Vous devez déterminer comment définir le débit en fonction de ce que vous incluez dans l'estimation du débit. 
   - Calculez le taux de perte pour chaque flux. Le taux de perte est le nombre de paquets non reçus divisé par le nombre de paquets envoyés. Le taux de perte est une mesure de la couche application. Réfléchissez donc à ce qui est logique lorsque vous définissez le taux de perte. 
   - Estimez le RTT moyen

```
python analysis_pcap_tcp_B.py ./assignement2.pcap
```

Ce script pose plusieurs problèmes :
- les **cwnd** sont indiquées en Bytes avec un MSS fixe (1460)
- les IP src et dst sont codées en dur dans le script

PS : ces scripts sont extraits de :
- [https://github.com/pkpraveen895/pcap-analyser.git](https://github.com/pkpraveen895/pcap-analyser.git)