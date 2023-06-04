#!bin/bash
var s3 ="upgrad-amala"
var myname = "Amala"
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
sudo apt install awscli
aws s3 \
sudo tar -cvf /tmp/${myname}-httpd-logs-${(date '+%d%m%Y-%H%M%S')}.tar /var/log/apache2
cp /tmp/${myname}-httpd-logs-${(date '+%d%m%Y-%H%M%S')}.tar s3://${s3_bucket}/${myname}-httpd-logs-${(date '+%d%m%Y-%H%M%S')}.tar
echo"completed"
