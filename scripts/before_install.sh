#!/bin/bash
# Stop the web server before deployment
echo "Stopping the web server..."
sudo service httpd stop || true   # For Apache (Amazon Linux)
#sudo service nginx stop || true   # For Nginx (Ubuntu)

# Clean up any old deployment files
echo "Cleaning up old application files..."
sudo rm -rf /var/www/html/*
