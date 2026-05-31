#!/bin/sh
# Start the Ollama server, wait for it to accept connections, pull any models
# named in PULL_MODELS (space-separated), then keep the server in the foreground.
set -e

ollama serve &
serve_pid=$!

echo "Waiting for Ollama server to become ready..."
until ollama list >/dev/null 2>&1; do
  sleep 1
done
echo "Ollama server is ready."

for model in ${PULL_MODELS:-}; do
  echo "Pulling model: ${model}"
  ollama pull "${model}"
done

# Hand the server back to the foreground so the container lifecycle tracks it.
wait "${serve_pid}"
