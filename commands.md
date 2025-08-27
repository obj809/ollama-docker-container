# Ollama

docker run -d \
  --name ollama \
  -v ollama:/root/.ollama \
  -p 11434:11434 \
  --restart always \
  ollama/ollama:latest


# Pull Ollama LLMs

docker exec -it ollama ollama pull llama3.1:latest
docker exec -it ollama ollama pull deepseek-r1:8b
docker exec -it ollama ollama pull gpt-oss:20b
docker exec -it ollama ollama pull codellama:7b
docker exec -it ollama ollama pull gemma3:4b


# Interaction Commands

docker exec -it ollama bash

ollama run llama3.1:latest
ollama run deepseek-r1:8b
ollama run gpt-oss:20b
ollama run codellama:7b
ollama run gemma3:4b

# Docker Commands

docker start ollama
docker stop ollama
docker restart ollama
docker rm ollama
docker volume rm ollama