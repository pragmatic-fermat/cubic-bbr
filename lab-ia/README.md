# Partie A : OpenAI ChatGPT avec packet_buddy

### Tache 0 : Installer Docker

Connectez-vous sur votre VM Linux.

```
snap install docker
```

### Tache 1 : Cloner le repo :

```
git clone https://github.com/pragmatic-fermat/packet_buddy.git
cd packet_buddy
```


### Tache 2 : Obtenir une Clé API OPENAI

Demander à votre meilleur ami (riche) du moment

### Tache 3 : Injecter la clé OPENAI

La renseigner dans le fichier ```docker-compose .yaml``` (sans simple/double quote) avec **vi** (ou **nano** pour les débutants Linux)


### Tache 4 : Lancer le service web

```
docker compose build
```

puis

```
docker compose up
```

### Tache 5 : Utiliser le prompt en ligne

Naviguez sur http://@IP:8505 , uploadez un petit (<2MB) pcap

Posez ensuite les questions, et appréciez les performance de votre nouveau stagaire réseau :)

La lecture du code est instructive; on comprend comment le contenu du pcap est envoyé à Chat-GPT...


# Partie B : Ollama  avec LPW

Cette fois-ci nous allons utiliser un LLM local sur une VM doté d'un GPU.

### Tache 1 : Installation

```
apt update
apt install -y python3
```

Installons OpenLLama : 
```
curl -fsSL https://ollama.com/install.sh | sh
```

Puis téléchargeons quelques *models* populaires :
```
ollama pull dolphin-mistral:latest
```
```
ollama pull llama3
```

Installons l'interface web :
```
git clone  https://github.com/kspviswa/local-packet-whisperer.git
cd local-packet-whisperer
python3 install -r requirements

pip install streamlit --upgrade
```

### Tache 2 : Utilisez l'interface web

Lancez l'interface Web
```
streamlit run bin/lpw_main.py
```

Connectez-vous avec un navigateur sur l'URL affichée, uploadez un pcap et jouez avec le chat et les *models*.


# Partie C : Ollama  avec Packet_buddy

### Tache 1 : Installation

Cette fois-ci on utilise un machine avec une  GPU !

```
apt update
apt install -y snap tshark
snap install docker
```

Installons mes drivers Nvidia :

```
apt install -y nvidia-utils-535-server nvidia-driver-535-server 
```

Vérifions :

```
nvidia-smi
```

Et

```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
echo $distribution
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update && apt-get install -y nvidia-container-toolkit
systemctl restart docker.service
```

### Tache 2 : Utilisons packet_buddy

```
git clone https://github.com/automateyournetwork/packet_buddy.git
```

Puis 

```
cd packet_buddy
docker compose build
docker compose up
```

Allez sur http://@IP:3002/ , pour découvrir l'interface de Ollama-UI
Creer un compte (à usage purement local)

Dans la roue dentée en haut à droite, selectionner *Settings* puis *Models*, indiquer puis télécharger un *model* (par ex mistral:7b )

Allez maintenant sur http://@IP:8505/ , uploader un pcap et choisir un des modèles téléchargés précemment.