#!/bin/bash
#
# Backup and Restore Script with Rotation
#
# This script automates the backup, rotation, and restoration of files.

# Exit immediately on error
set -e

BACKUP_DIR="/backups"
SOURCE_DIR="/data"
ROTATION_LIMIT=7

# Create a backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup files with timestamp
TIMESTAMP=$(date +\%Y\%m\%d_\%H\%M\%S)
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" -C "$SOURCE_DIR" .

# Rotate backups (keep only the latest N backups)
backup_count=$(ls -t "$BACKUP_DIR" | wc -l)
while [ $backup_count -gt $ROTATION_LIMIT ]; do
    oldest_backup=$(ls -t "$BACKUP_DIR" | tail -n 1)
    rm -f "$BACKUP_DIR/$oldest_backup"
    backup_count=$((backup_count - 1))
done

# Restore from a specific backup (if needed)
# tar -xzf "$BACKUP_DIR/backup_to_restore.tar.gz" -C "$SOURCE_DIR"

