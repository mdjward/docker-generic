#!/bin/bash

if [ -z "$XDEBUG_IDE_KEY" ];
then
	echo "XDEBUG_IDE_KEY not specified."
	exit 1
fi

if [ -z "$XDEBUG_REMOTE_HOST" ];
then
	export XDEBUG_REMOTE_HOST=172.17.42.1;
fi

if [ -z "$XDEBUG_REMOTE_PORT" ];
then
	export XDEBUG_REMOTE_PORT=9001;
fi

if [ -z "$XDEBUG_REMOTE_HANDLER" ];
then
	export XDEBUG_REMOTE_HANDLER="dbgp";
fi

if [ -z "$XDEBUG_MAX_NESTING_LEVEL" ];
then
	export XDEBUG_MAX_NESTING_LEVEL=200;
fi

if [ -n "$FPM_USER" ];
then
	sed -i "s/^\(user = \).\+/\1$FPM_USER/" /usr/local/etc/php-fpm.conf;
fi

if [ -n "$FPM_GROUP" ];
then
	sed -i "s/^\(group = \).\+/\1$FPM_GROUP/" /usr/local/etc/php-fpm.conf;
fi

php-fpm -d"xdebug.remote_enable=1" -d"xdebug.remote_host=$XDEBUG_REMOTE_HOST" -d"xdebug.remote_port=$XDEBUG_REMOTE_PORT" -d"xdebug.remote_handler=$XDEBUG_REMOTE_HANDLER" -d"xdebug.max_nesting_level=$XDEBUG_MAX_NESTING_LEVEL"
