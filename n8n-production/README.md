# n8n Local Development Setup for macOS

This is an optimized n8n installation for local development on macOS using PostgreSQL.

## 🎯 Why This Setup is Best for Local Development

- ✅ **No domain/SSL complexity** - Pure local development
- ✅ **PostgreSQL database** - Better performance than SQLite
- ✅ **Standard port 5678** - No port conflicts
- ✅ **File sharing** - Easy access to local files
- ✅ **Iran/Tehran timezone** - Configured for your location
- ✅ **Task runners enabled** - Future-proof configuration

## 🚀 Quick Start

### 1. Start n8n
```bash
docker compose up -d
```

### 2. Access n8n
Open your browser and go to: **http://localhost:5678**

### 3. Check status
```bash
docker compose ps
```

## 📋 Configuration Details

### Database Setup
- **Database**: PostgreSQL 16
- **Database Name**: n8n
- **Admin User**: n8n_admin
- **Application User**: n8n_user
- **Port**: 5678 (standard n8n port)

### Environment Configuration
- **Host**: localhost
- **Protocol**: http
- **Environment**: development
- **Timezone**: Asia/Tehran
- **Task Runners**: Enabled

### File Sharing
The `local-files` directory is mounted to `/files` inside the n8n container for easy file operations.

## 🔧 Management Commands

### Start services
```bash
docker compose up -d
```

### Stop services
```bash
docker compose stop
```

### Restart services
```bash
docker compose restart
```

### View logs
```bash
# All services
docker compose logs

# Just n8n
docker compose logs n8n

# Follow logs in real-time
docker compose logs -f n8n
```

### Update n8n
```bash
docker compose pull
docker compose up -d
```

### Reset everything (clean slate)
```bash
docker compose down -v
docker compose up -d
```

## 🗄️ Database Management

### Access PostgreSQL directly
```bash
docker compose exec postgres psql -U n8n_admin -d n8n
```

### Backup database
```bash
docker compose exec postgres pg_dump -U n8n_admin n8n > backup.sql
```

### Restore database
```bash
docker compose exec -T postgres psql -U n8n_admin -d n8n < backup.sql
```

## 📁 File Structure

```
n8n-production/
├── compose.yaml          # Docker Compose configuration
├── init-data.sh          # PostgreSQL initialization script
├── README.md            # This file
├── local-files/         # Shared files directory
└── install.sh           # Installation script
```

## 🎯 Benefits of This Setup

1. **Performance**: PostgreSQL is faster than SQLite for complex workflows
2. **Scalability**: Can handle more concurrent executions
3. **Reliability**: Better data integrity and transaction support
4. **Development**: Closer to production environments
5. **Simplicity**: No domain/SSL configuration needed
6. **Future-proof**: Task runners enabled for upcoming n8n versions

## 🔍 Troubleshooting

### Port 5678 already in use
```bash
# Check what's using the port
lsof -i :5678

# Kill the process if needed
kill -9 <PID>
```

### Database connection issues
```bash
# Check PostgreSQL logs
docker compose logs postgres

# Restart PostgreSQL
docker compose restart postgres
```

### Reset everything
```bash
# Stop and remove everything
docker compose down -v

# Start fresh
docker compose up -d
```

## 📞 Support

For issues with this setup, check the logs first:
```bash
docker compose logs n8n
docker compose logs postgres
```

For general n8n support, visit: https://community.n8n.io/

---

**Setup optimized for**: macOS local development
**Database**: PostgreSQL 16
**Timezone**: Asia/Tehran
**Status**: Ready for local development 