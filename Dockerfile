# Utilisation de l'image officielle WordPress comme base
FROM wordpress:latest

# Définition des variables d'environnement pour la connexion à MySQL
ENV WORDPRESS_DB_USER=wordpress
ENV WORDPRESS_DB_PASSWORD=ilovedevops
ENV WORDPRESS_DB_NAME=wordpress
ENV WORDPRESS_DB_HOST=0.0.0.0

# Exposer le port 80 (utilisé par Apache)
EXPOSE 80
