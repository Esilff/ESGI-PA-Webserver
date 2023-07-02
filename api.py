from flask import Flask, jsonify, request
import pymysql
import uuid
from datetime import datetime
from flask_cors import CORS


app = Flask(__name__)
CORS(app)
# Configuration de la base de données
db = pymysql.connect(host='localhost', user='root', password='', db='pute')

# Endpoint pour récupérer tous les utilisateurs
@app.route('/users', methods=['GET'])
def get_users():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM users")
    rows = cursor.fetchall()
    users = []
    for row in rows:
        user = {
            'id': row[0],
            'username': row[1],
            'email': row[2],
            'password': row[3],
            'money': row[4]
        }
        users.append(user)
    cursor.close()
    return jsonify(users)

# Endpoint pour créer un nouvel utilisateur
@app.route('/users', methods=['POST'])
def create_user():
    new_user = request.get_json()
    username = new_user['username']
    email = new_user['email']
    password = new_user['password']

    # Générer un identifiant unique pour le nouvel utilisateur
    user_id = str(uuid.uuid4())

    # Insertion du nouvel utilisateur dans la base de données
    cursor = db.cursor()
    cursor.execute("INSERT INTO users (username, email, password, money) VALUES (%s, %s, %s, %s)", (username, email, password, 0))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Utilisateur créé avec succès'})

# Endpoint pour supprimer un utilisateur par son ID
@app.route('/users/<user_id>', methods=['DELETE'])
def delete_user(user_id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM users WHERE id = %s", (user_id,))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Utilisateur supprimé avec succès'})

@app.route('/users/<user_id>', methods=['PUT'])
def update_user(user_id):
    # Récupérer les données de l'utilisateur à partir de la requête
    data = request.json
    username = data.get('username')
    email = data.get('email')
    money = data.get('money')
    password = data.get('password')

    # Vérifier si l'utilisateur existe
    user = find_user_by_id(user_id)
    if not user:
        return jsonify({'message': 'Utilisateur non trouvé'}), 404

    # Mettre à jour les propriétés de l'utilisateur
    if username:
        user['username'] = username
    if email:
        user['email'] = email
    if money:
        user['money'] = money
    if password:
        user['password'] = password

    # Mettre à jour l'utilisateur dans la base de données
    update_user_in_db(user)

    # Retourner la réponse avec les données de l'utilisateur mises à jour
    return jsonify({'message': 'Utilisateur mis à jour', 'user': user}), 200

# Fonction pour mettre à jour l'utilisateur dans la base de données
def update_user_in_db(user):
    # Connexion à la base de données

    cursor = db.cursor()

    # Exécution de la requête SQL pour mettre à jour l'utilisateur
    query = "UPDATE users SET username=%s, email=%s, money=%s, password=%s WHERE id=%s"
    cursor.execute(query, (user['username'], user['email'], user['money'], user['password'], user['id']))

    # Validation des modifications dans la base de données
    db.commit()

    # Fermeture de la connexion à la base de données
    cursor.close()

@app.route('/characters', methods=['GET'])
def get_characters():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM `character`")
    rows = cursor.fetchall()
    characters = []
    for row in rows:
        character = {
            'character_id': row[0],
            'name': row[1],
            'description': row[2],
            'silvervalue': row[3],
            'value': row[4],
            'date_added': row[5].strftime('%Y-%m-%d')
        }
        characters.append(character)
    cursor.close()
    return jsonify(characters)

# Endpoint pour créer un nouveau personnage
@app.route('/characters', methods=['POST'])
def create_character():
    new_character = request.get_json()
    name = new_character['name']
    description = new_character['description']
    silvervalue = new_character['silvervalue']
    value = new_character['value']
    date_added = new_character['date_added']

    # Insertion du nouveau personnage dans la base de données
    cursor = db.cursor()
    cursor.execute("INSERT INTO `character` (name, description, silvervalue, value, date_added) VALUES (%s, %s, %s, %s, %s)",
                   (name, description, silvervalue, value, date_added))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Personnage créé avec succès'})

# Endpoint pour supprimer un personnage par son ID
@app.route('/characters/<character_id>', methods=['DELETE'])
def delete_character(character_id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM `character` WHERE character_id = %s", (character_id,))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Personnage supprimé avec succès'})

@app.route('/characters/<character_id>', methods=['PUT'])
def update_character(character_id):
    # Récupérer les données du personnage à partir de la requête
    data = request.json
    name = data.get('name')
    description = data.get('description')
    silvervalue = data.get('silvervalue')
    value = data.get('value')
    date_added = data.get('date_added')

    # Vérifier si le personnage existe
    character = find_character_by_id(character_id)
    if not character:
        return jsonify({'message': 'Personnage non trouvé'}), 404

    # Mettre à jour les propriétés du personnage
    if name:
        character['name'] = name
    if description:
        character['description'] = description
    if silvervalue:
        character['silvervalue'] = silvervalue
    if value:
        character['value'] = value
    if date_added:
        character['date_added'] = date_added

    # Mettre à jour le personnage dans la base de données
    update_character_in_db(character)

    # Retourner la réponse avec les données du personnage mises à jour
    return jsonify({'message': 'Personnage mis à jour', 'character': character}), 200

# Fonction pour mettre à jour le personnage dans la base de données
def update_character_in_db(character):
    
    cursor = db.cursor()

    # Exécution de la requête SQL pour mettre à jour le personnage
    query = "UPDATE `character` SET name=%s, description=%s, silvervalue=%s, value=%s, date_added=%s WHERE character_id=%s"
    cursor.execute(query, (character['name'], character['description'], character['silvervalue'], character['value'], character['date_added'], character['character_id']))

    # Validation des modifications dans la base de données
    db.commit()

    # Fermeture de la connexion à la base de données
    cursor.close()
# ...

@app.route('/skins', methods=['GET'])
def get_skins():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM `skin`")
    rows = cursor.fetchall()
    print(rows)
    skins = []
    for row in rows:
        skin = {
            'id': row[0],
            'name': row[1],
            'value': row[2],
            'data_added': row[3].strftime('%Y-%m-%d'),
            'character': row[4],
            'imagepath': row[5].replace('\"', ''),
            'description': row[6],
            'price': row[7]
        }
        skins.append(skin)
    cursor.close()
    return jsonify({"skins": skins})  # Notez la modification ici

@app.route('/skins', methods=['POST'])
def create_skin():
    try:
        new_skin = request.get_json()
        name = new_skin['name']
        value = new_skin['value']
        data_added = new_skin['data_added']
        character = int(new_skin['character'])  # Convert to int
        price = new_skin['price']
        description = new_skin['description']
        imagepath = new_skin['imagepath']

        cursor = db.cursor()
        cursor.execute("INSERT INTO `skin` (name, value, data_added, `character`, price, description, imagepath) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                       (name, value, data_added, character, price, description, imagepath))
        db.commit()
        cursor.close()

        return jsonify({'message': 'Skin créé avec succès'})
    except Exception as e:
        return jsonify({'error': str(e)})


@app.route('/skins/<skin_id>', methods=['DELETE'])
def delete_skin(skin_id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM `skin` WHERE id = %s", (skin_id,))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Skin supprimé avec succès'})

@app.route('/skins/<skin_id>', methods=['PUT'])
def update_skin(skin_id):
    data = request.json
    name = data.get('name')
    value = data.get('value')
    data_added = data.get('data_added')
    character = data.get('character')
    price = data.get('price')
    description = data.get('description')
    imagepath = data.get('imagepath')

    cursor = db.cursor()
    query = "UPDATE `skin` SET name=%s, value=%s, data_added=%s, `character`=%s, price=%s, description=%s, imagepath=%s WHERE id=%s"
    cursor.execute(query, (name, value, data_added, character, price, description, imagepath, skin_id))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Skin mis à jour'}), 200

@app.route('/chronoplayer', methods=['GET'])
def get_chronoplayer():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM chronoplayer")
    rows = cursor.fetchall()
    chronoplayer = []
    for row in rows:
        data = {
            'id': row[0],
            'id_player': row[1],
            'name_player': row[2],
            'best_tour': row[3],
            'Time_total': row[4],
            'map_name': row[5]
        }
        chronoplayer.append(data)
    cursor.close()
    return jsonify(chronoplayer)

# Endpoint pour créer un nouvel enregistrement chronoplayer
@app.route('/chronoplayer', methods=['POST'])
def create_chronoplayer():
    try:
        new_chronoplayer = request.get_json()
        print(new_chronoplayer)

        required_keys = ['id_player', 'name_player', 'best_tour', 'Time_total', 'map_name']

        if not all(key in new_chronoplayer for key in required_keys):
            return jsonify({'error': 'Données de joueur manquantes'}), 400

        id_player = new_chronoplayer['id_player']
        name_player = new_chronoplayer['name_player']
        best_tour = new_chronoplayer['best_tour']
        Time_total = new_chronoplayer['Time_total']
        map_name = new_chronoplayer['map_name']

        # Insertion du nouvel enregistrement chronoplayer dans la base de données
        cursor = db.cursor()
        cursor.execute("INSERT INTO chronoplayer (id_player, name_player, best_tour, Time_total, map_name) VALUES (%s, %s, %s, %s, %s)",
                    (id_player, name_player, best_tour, Time_total, map_name))
        db.commit()
        cursor.close()

        return jsonify({'message': 'Enregistrement chronoplayer créé avec succès'})
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Endpoint pour supprimer un enregistrement chronoplayer par son ID
@app.route('/chronoplayer/<id>', methods=['DELETE'])
def delete_chronoplayer(id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM chronoplayer WHERE id = %s", (id,))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Enregistrement chronoplayer supprimé avec succès'})


@app.route('/login', methods=['POST'])
def login():
    data = request.json
    email = data.get('email')
    password = data.get('password')

    cursor = db.cursor()
    query = "SELECT * FROM users WHERE email=%s AND password=%s"
    cursor.execute(query, (email, password))
    user_data = cursor.fetchone()
    cursor.close()

    if user_data:
        user = {
            'id': user_data[0],
            'username': user_data[1],
            'email': user_data[2],
            'money': user_data[3],
            'password': user_data[4]
        }
        return jsonify({'message': 'Utilisateur trouvé', 'user': user}), 200
    else:
        return jsonify({'message': 'Utilisateur non trouvé'}), 404
    
def find_user_by_id(user_id):
    # Connexion à la base de données
    cursor = db.cursor()

    # Exécution de la requête SQL pour récupérer l'utilisateur par son ID
    query = "SELECT * FROM users WHERE id = %s"
    cursor.execute(query, (user_id,))
    user_data = cursor.fetchone()

    # Fermeture de la connexion à la base de données
    cursor.close()

    # Vérification si l'utilisateur a été trouvé
    if user_data:
        # Construction de l'objet utilisateur à partir des données récupérées
        user = {
            'id': user_data[0],
            'username': user_data[1],
            'email': user_data[2],
            'money': user_data[3],
            'password': user_data[4]
        }
        return user
    else:
        return None

def find_character_by_id(character_id):
    cursor = db.cursor()
    query = "SELECT * FROM `character` WHERE character_id = %s"
    cursor.execute(query, (character_id,))
    character_data = cursor.fetchone()
    cursor.close()
    if character_data:
        character = {
            'character_id': character_data[0],
            'name': character_data[1],
            'description': character_data[2],
            'silvervalue': character_data[3],
            'value': character_data[4],
            'date_added': character_data[5].strftime('%Y-%m-%d')
        }
        return character
    else:
        return None
if __name__ == '__main__':
    app.run()
