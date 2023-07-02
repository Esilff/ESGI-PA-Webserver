// Gestion des utilisateurs
document.getElementById('getUsers').addEventListener('click', function() {
    fetch('http://localhost:5000/users')
        .then(response => response.json())
        .then(data => {
            let table = createTable();

            // En-tête du tableau
            let header = table.createTHead();
            let headerRow = header.insertRow();
            ['Id', 'Username', 'Email', 'Money', 'Password', 'Actions'].forEach(text => {
                let cell = document.createElement('th');
                cell.textContent = text;
                headerRow.appendChild(cell);
            });

            // Corps du tableau
            let tbody = document.createElement('tbody');
            data.forEach(user => {
                let row = tbody.insertRow();
                ['id', 'username', 'email', 'money', 'password'].forEach(key => {
                    let cell = row.insertCell();
                    cell.textContent = user[key];
                });

                // Cellule des actions
                let cell = row.insertCell();

                // Bouton modifier
                let editButton = createButton('Modifier');
                editButton.addEventListener('click', () => {
                    // Code pour modifier l'utilisateur
                    console.log(`Modifier l'utilisateur ${user.id}`);
                });
                cell.appendChild(editButton);

                // Bouton supprimer
                let deleteButton = createButton('Supprimer');
                deleteButton.addEventListener('click', () => {
                    // Code pour supprimer l'utilisateur
                    console.log(`Supprimer l'utilisateur ${user.id}`);
                });
                cell.appendChild(deleteButton);
            });
            table.appendChild(tbody);
            
            // Remplacement de l'ancien contenu par le nouveau tableau
            let usersResult = document.getElementById('usersResult');
            usersResult.innerHTML = '';
            usersResult.appendChild(table);
        })
        .catch(error => console.error('Erreur:', error));
});

document.getElementById('createUser').addEventListener('click', function() {
    const username = document.getElementById('username').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:5000/users', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            username: username,
            email: email,
            password: password
        }),
    })
    .then(response => response.json())
    .then(data => alert(data.message))
    .catch((error) => console.error('Erreur:', error));
});

document.getElementById('deleteUser').addEventListener('click', function() {
    const userId = document.getElementById('userId').value;

    fetch(`http://localhost:5000/users/${userId}`, {
        method: 'DELETE',
    })
    .then(response => response.json())
    .then(data => alert(data.message))
    .catch((error) => console.error('Erreur:', error));
});

// Gestion des characters
document.getElementById('getCharacters').addEventListener('click', function() {
    fetch('http://localhost:5000/characters')
        .then(response => response.json())
        .then(data => {
            let table = createTable();

            // En-tête du tableau
            let header = table.createTHead();
            let headerRow = header.insertRow();
            ['Character ID', 'Name', 'Description', 'Silver Value', 'Value', 'Date Added', 'Actions'].forEach(text => {
                let cell = document.createElement('th');
                cell.textContent = text;
                headerRow.appendChild(cell);
            });

            // Corps du tableau
            let tbody = document.createElement('tbody');
            data.forEach(character => {
                let row = tbody.insertRow();
                ['character_id', 'name', 'description', 'silvervalue', 'value', 'date_added'].forEach(key => {
                    let cell = row.insertCell();
                    cell.textContent = character[key];
                });

                // Cellule des actions
                let cell = row.insertCell();

                // Bouton modifier
                let editButton = createButton('Modifier');
                editButton.addEventListener('click', () => {
                    // Code pour modifier le personnage
                    console.log(`Modifier le personnage ${character.character_id}`);
                });
                cell.appendChild(editButton);

                // Bouton supprimer
                let deleteButton = createButton('Supprimer');
                deleteButton.addEventListener('click', () => {
                    // Code pour supprimer le personnage
                    console.log(`Supprimer le personnage ${character.character_id}`);
                });
                cell.appendChild(deleteButton);
            });
            table.appendChild(tbody);
            
            // Remplacement de l'ancien contenu par le nouveau tableau
            let charactersResult = document.getElementById('charactersResult');
            charactersResult.innerHTML = '';
            charactersResult.appendChild(table);
        })
        .catch(error => console.error('Erreur:', error));
});

document.getElementById('createCharacter').addEventListener('click', function() {
    const name = document.getElementById('characterName').value;
    const description = document.getElementById('characterDescription').value;
    const silvervalue = document.getElementById('characterSilverValue').value;
    const value = document.getElementById('characterValue').value;
    const date_added = document.getElementById('characterDateAdded').value;

    fetch('http://localhost:5000/characters', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            name: name,
            description: description,
            silvervalue: silvervalue,
            value: value,
            date_added: date_added
        }),
    })
    .then(response => response.json())
    .then(data => alert(data.message))
    .catch((error) => console.error('Erreur:', error));
});

document.getElementById('deleteCharacter').addEventListener('click', function() {
    const characterId = document.getElementById('characterId').value;

    fetch(`http://localhost:5000/characters/${characterId}`, {
        method: 'DELETE',
    })
    .then(response => response.json())
    .then(data => alert(data.message))
    .catch((error) => console.error('Erreur:', error));
});

document.getElementById('getSkins').addEventListener('click', function() {
    fetch('http://localhost:5000/skins')
        .then(response => response.json())
        .then(data => {
            let table = createTable();

            // En-tête du tableau
            let header = table.createTHead();
            let headerRow = header.insertRow();
            ['ID', 'Nom', 'Valeur', 'Date d\'ajout', 'Description', 'Prix', 'Actions'].forEach(text => {
                let cell = document.createElement('th');
                cell.textContent = text;
                headerRow.appendChild(cell);
            });

            // Corps du tableau
            let tbody = document.createElement('tbody');
            data.skins.forEach(skin => {
                let row = tbody.insertRow();
                ['id', 'name', 'value', 'data_added', 'description', 'price'].forEach(key => {
                    let cell = row.insertCell();
                    cell.textContent = skin[key];
                });

                // Cellule des actions
                let cell = row.insertCell();

                // Bouton modifier
                let editButton = createButton('Modifier');
                editButton.addEventListener('click', () => {
                    // Code pour modifier le skin
                    console.log(`Modifier le skin ${skin.id}`);
                });
                cell.appendChild(editButton);

                // Bouton supprimer
                let deleteButton = createButton('Supprimer');
                deleteButton.addEventListener('click', () => {
                    // Code pour supprimer le skin
                    console.log(`Supprimer le skin ${skin.id}`);
                });
                cell.appendChild(deleteButton);
            });
            table.appendChild(tbody);

            // Remplacement de l'ancien contenu par le nouveau tableau
            let skinsResult = document.getElementById('skinsResult');
            skinsResult.innerHTML = '';
            skinsResult.appendChild(table);
        })
        .catch(error => console.error('Erreur:', error));
});

document.getElementById('createSkin').addEventListener('click', function() {
    const name = document.getElementById('skinName').value;
    const value = document.getElementById('skinValue').value;
    const dataAdded = document.getElementById('skinDataAdded').value;
    const description = document.getElementById('skinDescription').value;
    const price = document.getElementById('skinPrice').value;

    fetch('http://localhost:5000/skins', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            name: name,
            value: value,
            data_added: dataAdded,
            description: description,
            price: price
        }),
    })
    .then(response => response.json())
    .then(data => alert(data.message))
    .catch((error) => console.error('Erreur:', error));
});

document.getElementById('getChronoPlayers').addEventListener('click', function() {
    fetch('http://localhost:5000/chronoplayer')
        .then(response => response.json())
        .then(data => {
            let table = createTable();

            // En-tête du tableau
            let header = table.createTHead();
            let headerRow = header.insertRow();
            ['ID', 'ID Joueur', 'Nom Joueur', 'Meilleur Tour', 'Temps Total', 'Nom de la carte', 'Actions'].forEach(text => {
                let cell = document.createElement('th');
                cell.textContent = text;
                headerRow.appendChild(cell);
            });

            // Corps du tableau
            let tbody = document.createElement('tbody');
            data.forEach(chronoplayer => {
                let row = tbody.insertRow();
                ['id', 'id_player', 'name_player', 'best_tour', 'Time_total', 'map_name'].forEach(key => {
                    let cell = row.insertCell();
                    cell.textContent = chronoplayer[key];
                });

                // Cellule des actions
                let cell = row.insertCell();

                // Bouton modifier
                let editButton = createButton('Modifier');
                editButton.addEventListener('click', () => {
                    // Code pour modifier le chronoplayer
                    console.log(`Modifier le chronoplayer ${chronoplayer.id}`);
                });
                cell.appendChild(editButton);

                // Bouton supprimer
                let deleteButton = createButton('Supprimer');
                deleteButton.addEventListener('click', () => {
                    // Code pour supprimer le chronoplayer
                    console.log(`Supprimer le chronoplayer ${chronoplayer.id}`);
                });
                cell.appendChild(deleteButton);
            });
            table.appendChild(tbody);

            // Remplacement de l'ancien contenu par le nouveau tableau
            let chronoplayerResult = document.getElementById('chronoplayerResult');
            chronoplayerResult.innerHTML = '';
            chronoplayerResult.appendChild(table);
        })
        .catch(error => console.error('Erreur:', error));
});

document.getElementById('createChronoPlayer').addEventListener('click', function() {
    const idPlayer = document.getElementById('chronoplayerIdPlayer').value;
    const namePlayer = document.getElementById('chronoplayerNamePlayer').value;
    const bestTour = document.getElementById('chronoplayerBestTour').value;
    const timeTotal = document.getElementById('chronoplayerTimeTotal').value;
    const mapName = document.getElementById('chronoplayerMapName').value;

    fetch('http://localhost:5000/chronoplayer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            id_player: idPlayer,
            name_player: namePlayer,
            best_tour: bestTour,
            Time_total: timeTotal,
            map_name: mapName
        }),
    })
    .then(response => response.json())
    .then(data => alert(data.message))
    .catch((error) => console.error('Erreur:', error));
});

// Fonction utilitaire pour créer un bouton avec du texte donné
function createButton(text) {
    let button = document.createElement('button');
    button.textContent = text;
    return button;
}

// Fonction utilitaire pour créer un tableau
function createTable() {
    return document.createElement('table');
}


/**
 * Fonction utilitaire pour créer un tableau HTML.
 * @returns {HTMLTableElement} Le tableau HTML créé.
 */
function createTable() {
    return document.createElement('table');
}

/**
 * Fonction utilitaire pour créer un bouton HTML.
 * @param {string} text - Le texte du bouton.
 * @returns {HTMLButtonElement} Le bouton HTML créé.
 */
function createButton(text) {
    let button = document.createElement('button');
    button.textContent = text;
    return button;
}
