#!/bin/bash
# Set the correct permissions for the web server to access the files
echo "Setting permissions..."
sudo chown -R apache:apache /var/www/html   # For Apache
#sudo chown -R nginx:nginx /var/www/html     # For Nginx
