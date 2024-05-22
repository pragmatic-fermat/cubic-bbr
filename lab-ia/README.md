# Partie A : OpenAI ChatGPT avec packet_buddy

### Tache 0 : Installer Docker

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

La renseigner dans le ```docker-compose .yaml``` (sans simple/double quote)

### Tache 4 : Lancer le service wweb

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

# Partie B : Ollama  avec LPW

Cette fois-ci nous allons utiliser un LLM local sur une VM doté d'un GPU.

### Tache 1 : Installation

```
apt update
apt install -y python3
```

Installons OpenLLama et quelques *models* populaires :
```
curl -fsSL https://ollama.com/install.sh | sh

ollama pull dolphin-mistral:latest
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

Lancez 
```
streamlit run bin/lpw_main.py
```

Connectez-vous avec un navigateur sur l'URL affichée, uploadez un pcap et jouez avec le chat et les *models*.
