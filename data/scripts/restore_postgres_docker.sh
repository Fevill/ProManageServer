#!/bin/bash

# Nom du conteneur Docker où PostgreSQL est en cours d'exécution
CONTAINER_NAME="nom_conteneur_postgres"

# Paramètres de la base de données cible
TARGET_DB_NAME="nom_base_cible"
TARGET_DB_USER="utilisateur_cible"

# Fichier de sauvegarde à restaurer (sur la machine hôte)
DUMP_FILE="/chemin/vers/dossier/sauvegarde/backup_fichier.sql"

# Commande de restauration
echo "Début de la restauration sur le serveur cible..."
cat $DUMP_FILE | docker exec -i $CONTAINER_NAME psql -U $TARGET_DB_USER -d $TARGET_DB_NAME

if [ $? -eq 0 ]; then
    echo "Restauration réussie."
else
    echo "Erreur lors de la restauration."
    exit 1
fi
