document.getElementById('loginBtn').addEventListener('click', function() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    fetch('http://localhost:5000/users', {
        method: 'GET'
    }).then(response => response.json())
      .then(users => {
        var user = users.find(u => u.username === username && u.password === password);
        if(user) {
            if(user.name === 'beubeuh' || user.name === 'Esilff') {
                user.isAdmin = true;
                window.localStorage.setItem('admin', JSON.stringify(user));
                window .location.href = 'api.html';
            }
            localStorage.setItem('user', JSON.stringify(user));  // sauvegarde l'utilisateur connecté dans le localStorage
            window.location.href = 'player.html';  // redirection vers la page utilisateur
        } else {
            //selectionner le p et lui mettre un texte rouge
            document.querySelector('p').style.color = 'red';
            document.querySelector('p').textContent = 'Nom d\'utilisateur ou mot de passe incorrect.';
        }
    });
});
