#!/bin/bash

# Attendre que la base de données soit prête
until pg_isready -h db -U $POSTGRES_USER; do
    echo "En attente de la base de données..."
    sleep 2
done

echo "Début de la restauration..."
psql -h db -U $POSTGRES_USER -d $POSTGRES_DB -f /backup/restore.sql
echo "Restauration terminée."
