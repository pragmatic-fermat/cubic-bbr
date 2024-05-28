# Introduction

Dans ce lab, nous allons grapher **cwnd** en nous basant sur la collecte des indicateurs systèmes du coté de l'émétteur.

# Preparation du Client

Sur le Client (i.e votre VM linux dédiée), vous avez probablement déjà cloné le repository, plaçons-nous dans le bon répertoire :
```
git clone https://github.com/pragmatic-fermat/cubic-bbr.git
cd cubic-bbr/lab-graph/client
```

Désactivons l'historique et TSO dans les paramètres kernel :

```
chmod a+x prepare-kernel.sh
./prepare-kernel.sh
```

Installons les logiciels nécessaires (a priori déjà installés précedemment) :
```
apt update && apt install -y moreutils iperf3 python3-pandas nginx r-base-core r-cran-ggplot2
```

# Réalisation du "tir"

Dans 2 fenêtre sur le Client, executez :

## a) mesure de CWND en continu

Lançons le script de mesure du **cwnd** (basé sur ```ss``` ) dans un premier terminal

```
bash ss-output.sh @TARGET
```

## b) iperf vers la destination en spécifiant le CCA (ici RENO)

En parallèle, dans un second terminal, toujours sur la VM Client :

```
iperf3 -c @TARGET -P 3 -t 60 -C reno  
```

Le tir dure 60 sec. 

Lorsqu'il est fini, tappez (une seule fois) ```Ctrl-C``` dans le 1er terminal afin de stopper la collecte de données.

PS = ```@TARGET``` est fourni par l'animateur, c'est le routeur qui SNAT/DNAT ver le serveur, avec une application de bande-passante/delai/perte de paquet (voir [script de configuration](rtr/setup-bw.sh) )

PS2 : il est possible d'utiliser un script qui ajoute le calcul du début (tput) : [ss-output-add-tput.sh](client/ss-output-add-tput.sh)

# Creation du graphe CWND pour une connexion

Depuis le 1er terminal, vérifier que les données sont bien enregistrées :
```
ls -lh sender-ss.*
tail sender-ss.txt
```

Créeons maintenant le graphe et copions-le à dans le *content-dir* du serveur web sur notre Client :
```
python3 create-png.py

cp sender-ss.png /var/www/html/
```

Visiter http://@IPClient/sender-ss.png

Analysez !! (en comparant les résultats obtenus pour les 3 modes de CCA : **reno**, **cubic** et **bbr**)

# Creation du graphe CWND pour 3 connexions

Rejouez les étapes précedentes avec le script de collecte ```bash ss-output-add**-tput**.sh @TARGET```

Cette fois-ci le script de génération d'image (svg) est en R :

```
Rscript ss-data-analysis-cwnd-vs-time-no-ssthresh.R
cp sender-ss.svg /var/www/html/
```

Visiter http://@IPClient/sender-ss.svg

Nous ajoutons un autre graphe : l'évolution du RTT dans le temps :
```
Rscript ss-data-analysis-rtt-vs-time.R
cp sender-ss-rtt-vs-time.svg /var/www/html/
```
Cette fois-ci c'est http://@IPClient/sender-ss-rtt-vs-time.svg qu'il faut visiter.

---
PS : ce Lab est inspiré de [https://harshkapadia2.github.io/tcp-version-performance-comparison/](https://harshkapadia2.github.io/tcp-version-performance-comparison/).
