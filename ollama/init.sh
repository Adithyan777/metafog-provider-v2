#!/bin/bash

# Start Ollama server in the background
ollama serve &

# Wait for the server to be ready
while ! curl -s http://localhost:11434/api/version > /dev/null; do
    echo "Waiting for Ollama server to start..."
    sleep 1
done

# Use environment variable with default fallback
MODEL_NAME=${OLLAMA_MODEL:-"qwen2.5:0.5b"}
echo "Ollama server is ready. Pulling model: ${MODEL_NAME}..."

# Pull the specified model
ollama pull ${MODEL_NAME}

echo "Model pulled successfully. Server is ready to accept requests."

# Keep the container running
tail -f /dev/null