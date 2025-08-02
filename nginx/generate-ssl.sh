#!/bin/sh


DUMMY_DIR="/etc/letsencrypt/dummy"
DUMMY_KEY="$DUMMY_DIR/privkey.pem"
DUMMY_CERT="$DUMMY_DIR/fullchain.pem"

# Create dummy cert if real one doesn't exist

echo "Generating self-signed dummy SSL certificate for goldencart.biz..."
mkdir -p "$DUMMY_DIR"

openssl req -x509 -nodes -newkey rsa:2048 \
-days 1 \
-keyout "$DUMMY_KEY" \
-out "$DUMMY_CERT" \
-subj "/CN=localhost"


# Start nginx
echo "Starting Nginx..."
exec nginx -g "daemon off;"
