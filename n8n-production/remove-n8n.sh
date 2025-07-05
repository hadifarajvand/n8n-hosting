#!/bin/bash

# Remove n8n stack: containers, volumes, and network (images are kept)

echo "🛑 Stopping and removing n8n containers, volumes, and network..."
docker compose down -v

echo "✅ n8n stack removed (images are kept)" 