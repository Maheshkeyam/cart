#!/bin/sh

CERT_DIR="/etc/letsencrypt/demmy/goldencart.biz"
DUMMY_KEY="$CERT_DIR/privkey.pem"
DUMMY_CERT="$CERT_DIR/fullchain.pem"

# Create dummy cert if real one doesn't exist
if [ ! -f "$DUMMY_CERT" ] || [ ! -f "$DUMMY_KEY" ]; then
  echo "Generating self-signed dummy SSL certificate for goldencart.biz..."
  mkdir -p "$CERT_DIR"

  openssl req -x509 -nodes -newkey rsa:2048 \
    -days 1 \
    -keyout "$DUMMY_KEY" \
    -out "$DUMMY_CERT" \
    -subj "/CN=localhost"
else
  echo "SSL certificate already exists. Skipping dummy cert generation."
fi

# Start nginx
echo "Starting Nginx..."
exec nginx -g "daemon off;"
