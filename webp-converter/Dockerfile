FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y libjpeg-dev libwebp-dev && \
    pip install --no-cache-dir pillow

# Copy script and images
COPY convert.py .
COPY images ./images

# Run conversion at build time
RUN mkdir -p output && python convert.py

# Default command
CMD ["ls", "output"]
