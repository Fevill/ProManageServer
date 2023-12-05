#!/bin/bash

# Paramètres de la base de données cible
TARGET_DB_NAME="nom_base_cible"
TARGET_DB_USER="utilisateur_cible"
TARGET_HOST="hote_cible"

# Fichier de sauvegarde à restaurer
DUMP_FILE="/chemin/vers/dossier/sauvegarde/backup_fichier.sql"

# Commande de restauration
echo "Début de la restauration sur le serveur cible..."
psql -h $TARGET_HOST -U $TARGET_DB_USER -d $TARGET_DB_NAME < $DUMP_FILE

if [ $? -eq 0 ]; then
    echo "Restauration réussie."
else
    echo "Erreur lors de la restauration."
    exit 1
fi
