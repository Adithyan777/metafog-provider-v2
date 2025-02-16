# Stage 1: Download model for specific platform
FROM ollama/ollama AS model-downloader

ENV OLLAMA_MODEL=llama3.1

# Install curl
RUN apt-get update && apt-get install -y curl

# Start server, wait for it, and pull model
RUN ollama serve & \
    timeout 60 sh -c 'until curl -s http://localhost:11434/api/version > /dev/null; do sleep 1; done' && \
    ollama pull ${OLLAMA_MODEL} && \
    pkill ollama

# Stage 2: Create final image
FROM ollama/ollama

ENV OLLAMA_MODEL=llama3.1

# Install curl
RUN apt-get update && apt-get install -y curl

# Copy model files from first stage
COPY --from=model-downloader /root/.ollama /root/.ollama

# Add initialization script
COPY init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 11434

ENTRYPOINT ["/bin/bash"]
CMD ["/init.sh"]