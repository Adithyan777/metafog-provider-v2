FROM ollama/ollama

# Set default model name
ENV OLLAMA_MODEL=qwen2.5:0.5b

# Install curl for healthcheck
RUN apt-get update && apt-get install -y curl

# Add initialization script
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Expose API port
EXPOSE 11434

# Set entrypoint and command
ENTRYPOINT ["/bin/bash"]
CMD ["/init.sh"]