# Commands

Reference for running and working with this Ollama Docker setup. The API is
served at `http://localhost:${OLLAMA_PORT:-11434}` (default `11434`).

## Setup

```bash
cp .env.example .env        # optional: customize OLLAMA_PORT / PULL_MODELS
```

## Run

```bash
docker compose up -d --build   # build and start in the background
docker compose up --build      # build and run in the foreground (see live logs)
docker compose logs -f         # follow logs (watch model pulls on first boot)
docker compose ps              # show service status / health
```

## Stop

```bash
docker compose stop            # stop containers, keep them
docker compose down            # stop and remove containers (models persist)
docker compose down -v         # stop and DELETE the model volume (removes models)
docker compose restart         # restart the service
```

## Manage models

```bash
docker compose exec ollama ollama list             # list installed models
docker compose exec ollama ollama pull mistral     # pull another model
docker compose exec ollama ollama rm llama3.2      # remove a model
docker compose exec ollama ollama run llama3.2     # interactive chat in the container
```

To change which models are pulled automatically on startup, edit `PULL_MODELS`
(space-separated) in `.env` and run `docker compose up -d`.

## Use the API

```bash
# List available models
curl http://localhost:11434/api/tags

# Generate a completion
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.2",
  "prompt": "Why is the sky blue?"
}'

# Chat completion
curl http://localhost:11434/api/chat -d '{
  "model": "llama3.2",
  "messages": [{ "role": "user", "content": "Hello!" }]
}'
```

## Debug

```bash
docker compose logs -f ollama                  # follow service logs
docker compose exec ollama sh                  # shell into the container
docker compose config                          # render the resolved compose config
docker compose build --no-cache                # rebuild from scratch
docker volume inspect ollama-docker-container_ollama-data   # inspect the model volume
```
