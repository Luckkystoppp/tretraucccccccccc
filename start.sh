#!/bin/bash
# MAILER v7 PRO — start script
cd "$(dirname "$0")"

# Load .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | grep -v '^$' | xargs)
fi

PORT=${PORT:-3000}

# Kill anything on the port first (prevents Address already in use)
PID=$(lsof -t -i:$PORT 2>/dev/null)
if [ -n "$PID" ]; then
  echo "Killing process $PID on port $PORT..."
  kill -9 $PID 2>/dev/null
  sleep 1
fi

echo "Starting MAILER v7 PRO on port $PORT..."
python3 server.py
