#!/bin/bash

# Create and start n8n stack

echo "🚀 Starting n8n stack..."
docker compose up -d

echo "✅ n8n stack is running. Access it at http://localhost:5678" 