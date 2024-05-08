## Preparation du Client

Sur le Client, lancer :
```
apt update  
apt -y install iperf3 moreutils nginx
apt -y install python3-pip libjpeg-dev
python3 -m pip install pandas matplotlib
apt -y install r-base-core r-cran-ggplot2
```

Désactiver l'historique
```
sysctl -w net.ipv4.tcp_no_metrics_save=1  
```

Récuperer le script de mesure du CWND (basé sur ```ss``` )
```
curl https://raw.githubusercontent.com/pragmatic-fermat/cubic-bbr/main/labgraph/client/ss-output.sh
```

## Réalisation du "tir"

Dans 2 fenêtre sur le Client, executez :

#### a) mesure de CWND en continu
```
bash ss-output.sh @TARGET
```
#### b) iperf vers la destination en spécifiant le CCA (ici RENO)
```
iperf3 -c @TARGET -P 3 -t 60 -C reno  
```

Le tir dure 60 sec. Lorsqu'il est fini, tappez (une seule fois) ```Ctrl-C``` dans l'autre fenêtre afin de stopper la collecte de données.

PS = ```@TARGET``` est fourni par l'animateur, c'est le routeur qui SNAT/DNAT ver le serveur, avec une application de bande-passante/delai/perte de paquet (voir [script de configuration](rtr/setup-bw.sh) )

PS2 : il est possible d'utiliser un script qui ajoute le calcul du début (tput) : [ss-output-add-tput.sh](client/ss-output-add-tput.sh)

## Creation du graphe CWND pour une connexion
Vérifier que les données sont bien enregistrées :
```
ls -lh sender-ss.*
tail sender-ss.txt
```

Créeons maintenant le graphe et copions-le à dans le content-dir web du Client :
```
python3 create-png.py

cp sender-ss.png /var/www/html/
```

Visiter http://@IPClient/sender-ss.png
Analysez !!

## Creation du graphe CWND pour 3 connexions

On part du jeu de données précedent, cette fois-ci le script de génération d'image (svg) est en R :
```
Rscript ss-data-analysis-cwnd-vs-time-no-ssthresh.R
cp sender-ss.svg /var/www/html/
```

Visiter http://@IPClient/sender-ss.svg
Analysez !!

---
PS : ce Lab est inspiré de [https://harshkapadia2.github.io/tcp-version-performance-comparison/](https://harshkapadia2.github.io/tcp-version-performance-comparison/).
