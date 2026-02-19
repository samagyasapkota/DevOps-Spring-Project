#!/bin/bash

# Database backup script for PetClinic MySQL database
# This script will be run daily at 10 PM by cron

BACKUP_DIR="/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/petclinic_backup_$TIMESTAMP.sql"
DB_CONTAINER="petclinic-mysql"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform database backup
echo "Starting database backup at $(date)"

docker exec $DB_CONTAINER mysqldump \
    -u petclinic \
    -ppetclinic \
    petclinic > $BACKUP_FILE

# Compress the backup
gzip $BACKUP_FILE

echo "Backup completed: ${BACKUP_FILE}.gz"

# Keep only last 7 days of backups
find $BACKUP_DIR -name "petclinic_backup_*.sql.gz" -mtime +7 -delete

echo "Old backups cleaned up"
