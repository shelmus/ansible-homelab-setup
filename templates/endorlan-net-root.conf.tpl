# generated 2021-09-28, Mozilla Guideline v5.6, nginx 1.17.7, OpenSSL 1.1.1d, intermediate configuration
# https://ssl-config.mozilla.org/#server=nginx&version=1.17.7&config=intermediate&openssl=1.1.1d&guideline=5.6
server {
    listen 80 default_server;
    # Disabled IPv6
    # listen [::]:80 default_server;
    server_name endorlan.net www.endorlan.net;

    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl http2;
    # Disabled IPv6
    # listen [::]:443 ssl http2;
    access_log /var/log/nginx/root_endorlan_net_access.log;
    error_log /var/log/nginx/root_endorlan_net_error.log;
    server_name endorlan.net www.endorlan.net;

    ssl_certificate /etc/letsencrypt/live/endorlan.net/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/endorlan.net/privkey.pem;
    ssl_session_timeout 1d;
    ssl_session_cache shared:MozSSL:10m;  # about 40000 sessions
    ssl_session_tickets off;

    ssl_dhparam /etc/ssl/nginx-dhparams.pem;

    # intermediate configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;

    # HSTS (ngx_http_headers_module is required) (63072000 seconds)
    add_header Strict-Transport-Security "max-age=63072000" always;

    # OCSP stapling
    ssl_stapling on;
    ssl_stapling_verify on;

    # verify chain of trust of OCSP response using Root CA and Intermediate certs
    # ssl_trusted_certificate /path/to/root_CA_cert_plus_intermediates;

    # replace with the IP address of your resolver
    # resolver 127.0.0.1;
    
    location / {
        root /var/www/html/root_endorlan_net/index.html;
    }

    location /guacamole/ {
        proxy_pass https://10.0.0.14/guacamole/;
        proxy_buffering off;
        proxy_http_version 1.1;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $http_connection;
        access_log off;
    }
}