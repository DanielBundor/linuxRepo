#!/bin/bash
#
# Log Rotation Script
#
# This script automates log rotation to prevent log files from consuming too much disk space.

LOG_DIR="/var/log/myapp"
MAX_LOG_SIZE="10M"

# Rotate logs if they exceed the specified size
find "$LOG_DIR" -type f -size +$MAX_LOG_SIZE -exec mv {} {}.old \;

# Compress old log files
find "$LOG_DIR" -type f -name "*.old" -exec gzip {} \;

# Delete log files older than 7 days
find "$LOG_DIR" -type f -name "*.gz" -mtime +7 -exec rm {} \;

