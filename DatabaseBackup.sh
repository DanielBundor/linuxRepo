#!/bin/bash
#
# Database Backup Script
#
# This script automates the process of taking regular database backups.

# Database credentials
DB_USER="username"
DB_PASS="password"
DB_NAME="database_name"

# Backup filename with timestamp
BACKUP_FILENAME="backup_$(date +\%Y\%m\%d_\%H\%M\%S).sql"

# Perform the database backup
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILENAME"

# Move the backup to a backup directory
mkdir -p /backups
mv "$BACKUP_FILENAME" /backups/

