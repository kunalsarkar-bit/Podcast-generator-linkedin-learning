FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git

# Allow pip to override system restrictions (PEP 668 fix)
RUN pip3 install --break-system-packages PyYAML

# Copy feed generator
COPY feed.py /usr/bin/feed.py

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
