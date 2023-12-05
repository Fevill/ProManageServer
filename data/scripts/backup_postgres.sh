#!/bin/bash

# Paramètres de la base de données source
SOURCE_DB_NAME="nom_base_source"
SOURCE_DB_USER="utilisateur_source"
SOURCE_HOST="hote_source"

# Emplacement de sauvegarde
BACKUP_DIR="/chemin/vers/dossier/sauvegarde"
DUMP_FILE="backup_${SOURCE_DB_NAME}_$(date +%Y%m%d).sql"

# Commande de sauvegarde
echo "Début de la sauvegarde de la base de données..."
pg_dump -h $SOURCE_HOST -U $SOURCE_DB_USER $SOURCE_DB_NAME > $BACKUP_DIR/$DUMP_FILE

if [ $? -eq 0 ]; then
    echo "Sauvegarde réussie."
else
    echo "Erreur lors de la sauvegarde."
    exit 1
fi
