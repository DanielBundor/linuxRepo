#!/bin/bash
#
# Server Health Check Script
#
# This script automates server health checks and sends alerts if issues are detected.

WEBSITE_URL="http://example.com"
ADMIN_EMAIL="admin@example.com"

# Check if the website is accessible
if ! curl -s -o /dev/null "$WEBSITE_URL"; then
    echo "Website is down! Sending alert..."
    mail -s "Website Alert" "$ADMIN_EMAIL" <<< "Website is down!"
fi

# Add more health checks as needed (e.g., check database connectivity, disk space, etc.)

