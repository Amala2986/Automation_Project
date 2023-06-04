#!/bin/bash
sudo apt update -y
echo "--APACHE2 PACKAGE INSTALLATION--"
pkg=apache2
status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
  sudo apt install $pkg
  echo "--APACHE INSTALLED--"
fi
if [ $? = 0 ]||[ "$status" = installed ];
then
  echo "--APACHE ALREADY INSTALLED--"
fi
sudo systemctl status apache2
echo
echo
sudo apt install awscli
sudo tar -cvf /tmp/amala-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /var/log/apache2
aws s3 cp /tmp/amala-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar s3://upgrad-amala/
echo "completed"
