#!/bin/bash
#
# Backup Configuration Script
#
# This script automates the backup of configuration files.

CONFIG_DIR="/etc/myapp"
BACKUP_DIR="/backups/config"
TIMESTAMP=$(date +\%Y\%m\%d_\%H\%M\%S)

# Create a backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Archive and compress configuration files
tar -czf "$BACKUP_DIR/config_$TIMESTAMP.tar.gz" -C "$CONFIG_DIR" .

# Delete backups older than 30 days
find "$BACKUP_DIR" -type f -mtime +30 -exec rm {} \;

