#!/bin/bash

echo "Starting application and webserver...";

echo "php -v";
php -v
echo "nginx -v";
nginx -v

echo "will start php";
service php7.2-fpm start
echo "php status below";
service php7.2-fpm status


echo "will start ssh server";
service sshd start
echo "ssh server status below";
service sshd status


echo "will start nginx";
service nginx start
echo "nginx status below";
service nginx status
