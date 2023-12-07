#!/bin/bash

# Nom du conteneur Docker où PostgreSQL est en cours d'exécution
CONTAINER_NAME="nom_conteneur_postgres"

# Paramètres de la base de données source
SOURCE_DB_NAME="nom_base_source"
SOURCE_DB_USER="utilisateur_source"

# Emplacement de sauvegarde (sur la machine hôte)
BACKUP_DIR="/chemin/vers/dossier/sauvegarde"
DUMP_FILE="backup_${SOURCE_DB_NAME}_$(date +%Y%m%d).sql"

# Commande de sauvegarde
echo "Début de la sauvegarde de la base de données..."
docker exec $CONTAINER_NAME pg_dump -U $SOURCE_DB_USER $SOURCE_DB_NAME > $BACKUP_DIR/$DUMP_FILE

if [ $? -eq 0 ]; then
    echo "Sauvegarde réussie."
else
    echo "Erreur lors de la sauvegarde."
    exit 1
fi
