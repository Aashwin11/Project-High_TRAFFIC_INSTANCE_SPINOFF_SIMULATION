#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "<html><body><h1> INSTANCE ID = ${instance_id} </h1></body></html>" > var/www/html/index.html