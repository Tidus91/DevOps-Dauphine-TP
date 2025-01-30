# Utilisation de l'image officielle WordPress comme base
FROM wordpress:latest

# Définition des variables d'environnement pour la connexion à MySQL
ENV WORDPRESS_DB_USER=wordpress
ENV WORDPRESS_DB_PASSWORD=ilovedevops
ENV WORDPRESS_DB_NAME=wordpress
ENV WORDPRESS_DB_HOST=34.28.125.190

# Exposer le port 80 (utilisé par Apache)
ENV PORT 8080
EXPOSE 8080

# Configurer WordPress pour écouter sur le port 8080
CMD ["sh", "-c", "docker-entrypoint.sh php-fpm && docker-entrypoint.sh apache2-foreground --port 8080"]
