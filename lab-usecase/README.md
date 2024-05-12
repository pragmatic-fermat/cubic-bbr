

Voici la capture à télécharger et à injecter dans Wireshark.

Répondre aux questions :

- liste des flow TCP

Pour chaque flux TCP :
- calcul du RTT initial
- quelle est la taille initiale de la fenetre du recepteur (= RCV Window) ?
- quelle est la taille maximale de fenetre du recepteur ? (valeur et numero de paquet)
- y a-t-il des SACK ? pourquoi ?
- débit de l'émetteur de données
- nombre de retransmissions dus à des 3x DUP ACK ou RTO (=2 x RTT) ? Quels numéros de paquets ?
- estimation des 5 premières CWND (basé sur le Bytes in Flight = BIF)
- combien de temps dure le Slow Start (=SS)  ?
- quel est la valeur initiale de SSThres ?

