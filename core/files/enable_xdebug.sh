#!/bin/bash

apt-get update
apt-get install php-xdebug
cat > /etc/php/7.4/fpm/conf.d/20-xdebug.ini <<EOL
zend_extension=xdebug
xdebug.mode = debug
xdebug.client_port = 9999
xdebug.client_host = host.docker.internal
xdebug.idekey = VSCODE
xdebug.xdebug.start_with_request = yes
xdebug.discover_client_host = 1
EOL
/etc/init.d/php7.4-fpm restart