# Justfile for managing PostgreSQL with Docker Compose

# Default recipe
default:
    @just --list

# Start PostgreSQL in the background
up:
    @docker compose up -d postgres

# Stop PostgreSQL
down:
    @docker compose down

# Restart PostgreSQL
restart:
    @docker compose restart postgres

# Show PostgreSQL logs
logs:
    @docker compose logs -f postgres

# Check container status
status:
    @docker compose ps

# Open a PostgreSQL shell
psql:
    @docker exec -it local-postgres psql -U postgres

# Stop and remove containers
clean:
    @docker compose down

# Stop containers and delete PostgreSQL data
reset:
    @docker compose down --volumes
