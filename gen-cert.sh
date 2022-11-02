# 1. remove server {} config from nginx for port 443, keep only port 80
# 2. start docker-compose up -d
# 3.

#docker-compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d www.xxx.com
# Then without dry-run if it worked

#. if this does not work, then list containers with docker ps, then do
# docker exec -it <certbotcontainerid> /bin/sh
# and debug from there using certbot command
