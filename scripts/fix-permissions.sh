#!/bin/bash

# =================================================================
# WordPress Permissions Fix Script for Apache on Ubuntu
# Author: Michael Nnah
# Description: Automatically resets ownership and permissions 
#              to the standard secure WordPress model.
# =================================================================

# Define the path to your WordPress root
TARGET="/var/www/html"

echo "🚀 Starting permissions reset for $TARGET..."

# 1. Set Ownership to Apache User (www-data)
echo "Setting ownership to www-data..."
sudo chown -R www-data:www-data $TARGET

# 2. Set Directory Permissions to 755 (Drwxr-xr-x)
echo "Setting directory permissions to 755..."
sudo find $TARGET -type d -exec chmod 755 {} \;

# 3. Set File Permissions to 644 (-rw-r--r--)
echo "Setting file permissions to 644..."
sudo find $TARGET -type f -exec chmod 644 {} \;

# 4. Secure wp-config.php (Extra Security Layer)
echo "Securing wp-config.php..."
sudo chmod 640 $TARGET/wp-config.php

echo "✅ Permissions reset successfully!"
echo "You can now upload media and update plugins without issues."
