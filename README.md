# Ollama Docker Container

A Docker setup for running [Ollama](https://ollama.com) (local LLM serving) in a
container. Models are pulled automatically on startup and persisted across
restarts.

## Quick start

```bash
cp .env.example .env
docker compose up -d
```

The Ollama API is then available at `http://localhost:11434`.

```bash
# Verify it's running
curl http://localhost:11434/api/tags

# Chat with a model
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.2",
  "prompt": "Why is the sky blue?"
}'
```

## Configuration

Set these in `.env` (see `.env.example`):

| Variable      | Default     | Description                                            |
| ------------- | ----------- | ------------------------------------------------------ |
| `OLLAMA_PORT` | `11434`     | Host port mapped to the container's Ollama API.        |
| `PULL_MODELS` | `llama3.2`  | Space-separated models to pull on startup.             |

Browse available models at <https://ollama.com/library>.

## Common commands

```bash
docker compose up -d --build   # rebuild and restart
docker compose logs -f         # follow logs (watch model pulls)
docker compose exec ollama ollama list    # list installed models
docker compose exec ollama ollama pull mistral   # pull another model
docker compose down            # stop (models persist in the volume)
docker compose down -v         # stop and delete the model volume
```

## GPU support

NVIDIA GPU acceleration requires the
[NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
on the host. Uncomment the `deploy.resources` block in `docker-compose.yml`.
