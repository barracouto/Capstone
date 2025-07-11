#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

echo "<html><h1>This is the ${env} ${visibility} server</h1></html>" > /var/www/html/index.html
