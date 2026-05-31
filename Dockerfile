# Wraps the official Ollama image with an entrypoint that pulls configured
# models on startup before handing off to `ollama serve`.
FROM ollama/ollama:latest

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
