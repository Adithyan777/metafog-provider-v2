#!/bin/bash
ollama serve &
while ! curl -s http://localhost:11434/api/version > /dev/null; do
    echo "Waiting for Ollama server to start..."
    sleep 1
done
echo "Ollama server is ready..."
tail -f /dev/null