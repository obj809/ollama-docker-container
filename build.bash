```bash
docker run -d \
  --name ollama \
  -v ollama:/root/.ollama \
  -p 11434:11434 \
  --restart always \
  ollama/ollama:latest
```