
## Tache 0 Installer Docker

```
snap install docker
```

## Tache 1 Cloner le repo :

```
git clone https://github.com/pragmatic-fermat/packet_buddy.git
cd packet_buddy
```


## Tache 2 Obtenir une Clé API OPENAI

Demander à votre meilleur ami (riche) du moment

## Tache 3 Injecter la clé OPENAI

La renseigner dans le ```docker-compose .yaml``` (sans simple/double quote)

## Tache 4 Lancer le service wweb

```
docker compose build
```

puis

```
docker compose up
```

## Tache 5 Utiliser le prompt en ligne

Naviguez sur http://@IP:8505 , uploadez un petit (<2MB) pcap

Posez ensuite les questions, et appréciez les performance de votre nouveau stagaire réseau :)
