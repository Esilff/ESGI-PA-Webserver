import socket

SERVER_HOST = '0.0.0.0'  # Adresse IP du serveur (0.0.0.0 pour toutes les interfaces)
SERVER_PORT = 1234

def start_server():
    # Création de la socket du serveur
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((SERVER_HOST, SERVER_PORT))
    server_socket.listen(1)  # Écoute d'une seule connexion client

    print("Le serveur écoute sur {}:{}".format(SERVER_HOST, SERVER_PORT))

    # Attente de la connexion d'un client
    client_socket, client_address = server_socket.accept()
    print("Connexion établie avec {}:{}".format(client_address[0], client_address[1]))

    while True:
        # Réception des données envoyées par le client
        data = client_socket.recv(1024).decode()
        if not data:
            break  # La connexion client est terminée
        print("Reçu du client : {}".format(data))

    # Fermeture de la connexion client
    client_socket.close()

    # Fermeture de la socket du serveur
    server_socket.close()

if __name__ == '__main__':
    start_server()
