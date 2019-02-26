#!/bin/sh
yum -y instsall redis
systemctl enable redis
systemctl start redis

firewall-cmd --zone=public --add-port=6379/tcp --permanent
firewall-cmd --reload
