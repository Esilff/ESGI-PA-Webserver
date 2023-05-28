# ESGI-PA-Webserver

# Flask API pour la gestion d'utilisateurs, de personnages et de skins

Ce projet implémente une API Flask permettant de gérer les utilisateurs, les personnages et les skins. Il utilise une base de données MySQL pour stocker les données.

## Dépendances

- Python 3.7 ou version ultérieure
- Flask 1.1.2 ou version ultérieure
- PyMySQL 1.0.2 ou version ultérieure

## Configuration de la base de données

Assurez-vous d'avoir une base de données MySQL configurée et accessible. Vous devez également créer les tables nécessaires pour les utilisateurs, les personnages et les skins. Vous pouvez utiliser les scripts SQL fournis dans le code source pour créer les tables.

## Installation des dépendances

1. Clonez le référentiel Git ou téléchargez les fichiers source.

2. Installez les dépendances Python en exécutant la commande suivante :

   ```shell
   pip install -r requirements.txt

## Configuration de la base de données

Ouvrez le fichier app.py avec un éditeur de texte.

Dans la fonction app.run(), modifiez les valeurs des paramètres host, user, password et db pour correspondre à votre configuration de base de données MySQL.

Lancement de l'application
Dans le répertoire racine de l'application, exécutez la commande suivante :

shell
Copy code
python app.py
L'application sera exécutée sur http://localhost:5000/. Vous pouvez accéder à l'API à l'aide de cet URL.

Utilisation de l'API
Une fois l'application en cours d'exécution, vous pouvez utiliser les endpoints suivants :

GET /users : récupère tous les utilisateurs.

POST /users : crée un nouvel utilisateur.

DELETE /users/<user_id> : supprime un utilisateur par son ID.

GET /characters : récupère tous les personnages.

POST /characters : crée un nouveau personnage.

DELETE /characters/<character_id> : supprime un personnage par son ID.

GET /skins : récupère tous les skins.

POST /skins : crée un nouveau skin.

DELETE /skins/<skin_id> : supprime un skin par son ID.

Assurez-vous de fournir les données correctes au format JSON lors de l'envoi des requêtes POST pour créer de nouveaux utilisateurs, personnages ou skins.

swift
Copy code

Pour ce qui est de la configuration de Docker, voici un exemple de fichier `Dockerfile` pour créer une image Docker de l'application Flask :

```Dockerfile
FROM python:3.9

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
Vous pouvez créer l'image Docker à l'aide de la commande suivante dans le répertoire racine de l'application :

shell
Copy code
docker build -t flask-api .
Une fois l'image créée, vous pouvez lancer un conteneur Docker à l'aide de la commande suivante :

shell
Copy code
docker run -d -
````

## lancement avec xampp

1. lancer xampp
2. lancer apache et mysql
3. aller sur phpmyadmin
4. créer une base de donnée nommée "esgi-pa-webserver"
5. importer le fichier "esgi-pa-webserver.sql" dans la base de donnée
6. lancer le fichier "app.py" avec python
7. aller sur http://localhost:5000/ pour accéder à l'api


