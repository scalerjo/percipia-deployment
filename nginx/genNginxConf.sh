#!/bin/bash

cat <<'EOF' > default.conf
server {
    listen 80;

    location /api {
        rewrite /api(?:/(.*))? /$1 break;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_set_header X-Real-Port $server_port;
        proxy_set_header X-Real-Scheme $scheme;
        proxy_set_header X-NginX-Proxy true;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://backend;
    }

    location / {
        root /var/www/html;
        try_files $uri /index.html;
    }
}
EOF

cat <<EOF >> default.conf
upstream backend {
    server $1:8888;
}
EOF