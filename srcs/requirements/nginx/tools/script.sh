#!/bin/bash

mkdir -p /etc/nginx/ssl

if [ ! -e /etc/.firstrun ]; then
	openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
		-out '/etc/nginx/ssl/cert.crt' \
		-keyout '/etc/nginx/ssl/cert.key' \
		-subj "/CN=$DOMAIN_NAME" \
		>/dev/null 2>/dev/null
	touch /etc/.firstrun
fi

exec nginx -g 'daemon off;'