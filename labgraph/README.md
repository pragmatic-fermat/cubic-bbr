Sur le Client, lancer :
```
apt update  
apt -y install iperf3 moreutils nginx
apt -y install python3-pip libjpeg-dev
python3 -m pip install pandas matplotlib
apt install nginx
```

Désactiver l'historique
```
sysctl -w net.ipv4.tcp_no_metrics_save=1  
```

Dans 2 terminaux sur le Client, executez :
 a) mesure de CWND en continu
```
bash ss-output.sh @TARGET
```
b) iperf vers la destination en spécifiant le CCA (ici RENO)
```
iperf3 -c @TARGET -P 3 -t 60 -C reno  
```

PS = ```@TARGET``` est fourni par l'animateur

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
