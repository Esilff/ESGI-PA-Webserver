from flask import Flask, jsonify, request
import pymysql
import uuid

app = Flask(__name__)

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
            'password': row[3]
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
    cursor.execute("INSERT INTO users (id, username, email, password) VALUES (%s, %s, %s, %s)", (user_id, username, email, password))
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

# ...

# Endpoint pour récupérer tous les skins
@app.route('/skins', methods=['GET'])
def get_skins():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM `skin`")
    rows = cursor.fetchall()
    skins = []
    for row in rows:
        skin = {
            'id': row[0],
            'name': row[1],
            'value': row[2],
            'data_added': row[3].strftime('%Y-%m-%d'),
            'character': row[4]
        }
        skins.append(skin)
    cursor.close()
    return jsonify(skins)

# Endpoint pour créer un nouveau skin
@app.route('/skins', methods=['POST'])
def create_skin():
    new_skin = request.get_json()
    name = new_skin['name']
    value = new_skin['value']
    data_added = new_skin['data_added']
    character = new_skin['character']

    # Insertion du nouveau skin dans la base de données
    cursor = db.cursor()
    cursor.execute("INSERT INTO `skin` (name, value, data_added, character) VALUES (%s, %s, %s, %s)",
                   (name, value, data_added, character))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Skin créé avec succès'})

def delete_skin(skin_id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM `skin` WHERE id = %s", (skin_id,))
    db.commit()
    cursor.close()

    return jsonify({'message': 'Skin supprimé avec succès'})


if __name__ == '__main__':
    app.run()
