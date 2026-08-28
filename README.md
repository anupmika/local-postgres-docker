# Local PostgreSQL with Docker

Run a PostgreSQL database locally using Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Clone the repository
2. Create the environment file
3. Start PostgreSQL
4. Connect to the database

## Configuration

Explain:

POSTGRES_USER
POSTGRES_PASSWORD
POSTGRES_DB
POSTGRES_PORT

## Useful Docker Commands

Start
Stop
Restart
Logs
Database shell

## Connecting from an Application

Host: localhost
Port: 5432
Database: myapp
Username: postgres
Password: postgres

## Data Persistence

Explain the Docker volume.

## Reset Database

docker compose down -v
docker compose up -d
