#!/bin/bash

# n8n Local Development Installation Script for macOS
# This script automates the installation process for local development

set -e

echo "🚀 Starting n8n local development installation"
echo "=============================================="

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop and try again."
    exit 1
fi

echo "✅ Docker is running"

# Check if local-files directory exists
if [ ! -d local-files ]; then
    echo "📁 Creating local-files directory..."
    mkdir -p local-files
    echo "✅ local-files directory created"
else
    echo "✅ local-files directory already exists"
fi

# Check if init-data.sh is executable
if [ ! -x init-data.sh ]; then
    echo "🔧 Making init-data.sh executable..."
    chmod +x init-data.sh
    echo "✅ init-data.sh is now executable"
fi

# Pull latest images
echo "📥 Pulling latest Docker images..."
docker compose pull

# Start the services
echo "🚀 Starting n8n services..."
docker compose up -d

# Wait for services to start
echo "⏳ Waiting for services to start..."
sleep 15

# Check service status
echo "📊 Checking service status..."
docker compose ps

echo ""
echo "🎉 Installation complete!"
echo "=============================================="
echo "🌐 Access n8n at: http://localhost:5678"
echo "🗄️ Database: PostgreSQL 16"
echo "🕐 Timezone: Asia/Tehran"
echo "🔧 Environment: Development"
echo ""
echo "📋 Useful commands:"
echo "  View logs: docker compose logs -f n8n"
echo "  Stop services: docker compose stop"
echo "  Restart services: docker compose restart"
echo "  Update n8n: docker compose pull && docker compose up -d"
echo "  Reset everything: docker compose down -v && docker compose up -d"
echo ""
echo "📚 For more information, see README.md" 