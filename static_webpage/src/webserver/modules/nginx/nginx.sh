#!/bin/bash
# Author: michael_kedey
# Date: 03/07/2024
# Last_modified: 04/07/2024
# Purpose: install nginx

sudo apt-get update
sudo apt-get upgrade -y

# Install nginx and start the service
sudo apt-get install -y nginx
sudo systemctl enable nginx

# Create directories for the static website
sudo mkdir -p /var/www/html/static_website

# Copy the website files from the webserver_files directory
sudo cp ./webserver_files/index.html /var/www/html/static_website/index.html
sudo cp ./webserver_files/styles.css /var/www/html/static_website/styles.css
sudo cp ./webserver_files/script.js /var/www/html/static_website/script.js

# Restart nginx to apply changes
sudo systemctl restart nginx
