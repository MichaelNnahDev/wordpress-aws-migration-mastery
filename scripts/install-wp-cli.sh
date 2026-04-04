#!/bin/bash

# =================================================================
# WP-CLI Installation & Database Search-Replace Script
# Author: Michael Nnah
# =================================================================

echo "📥 Downloading WP-CLI..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

echo "⚙️ Setting permissions and moving to global path..."
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Verify installation
wp --info

echo "✅ WP-CLI is ready. Run your search-replace command now."
