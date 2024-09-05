#!/bin/bash
# Start the web server after deployment
echo "Starting the web server..."
sudo service httpd start   # For Apache (Amazon Linux)
#sudo service nginx start   # For Nginx (Ubuntu)
