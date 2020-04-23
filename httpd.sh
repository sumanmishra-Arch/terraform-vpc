#!/bin/bash

# install nginx
sudo yum update httpd -y ;
sudo yum install httpd -y;


# make sure nginx is started
sudo systemctl start httpd;
sudo systemctl status httpd;