# 🐘 Local PostgreSQL with Docker

Run a PostgreSQL database locally using Docker Compose.

The PostgreSQL image is pinned to a specific major version (`postgres:18`)
instead of `postgres:latest` to avoid silent major-version upgrades, which
changed the on-disk data layout and broke the volume mount.

## 📋 Prerequisites

- Docker
- Docker Compose v2
- [just](https://github.com/casey/just) (optional, for shortcuts)

## 🚀 Getting Started

1. Clone the repository
2. Create the environment file:

   ```sh
   cp .env.example .env
   ```

   Edit `.env` to override any value. All variables have safe defaults, so
   this step is optional and can be skipped.

3. Start PostgreSQL:

   ```sh
   docker compose up -d
   ```

   Or with `just`:

   ```sh
   just up
   ```

   > If port `5432` is already in use (for example, a local system PostgreSQL),
   > either stop/remove the local PostgreSQL or set `POSTGRES_PORT` in `.env`
   > to a free port (the container maps `${POSTGRES_PORT:-5432}:5432`).

4. Connect to the database (see below).

## ⚙️ Configuration

The following environment variables are read from `.env` (with defaults):

| Variable          | Default        | Used for                          |
| ----------------- | -------------- | --------------------------------- |
| `POSTGRES_USER`   | `postgres`     | Superuser name created on init    |
| `POSTGRES_PASSWORD` | `postgres`   | Superuser password (set on init)  |
| `POSTGRES_DB`     | `postgres_db`  | Default database created on init  |
| `POSTGRES_PORT`   | `5432`         | Host port the container maps to   |

## 🛠️ Useful Commands

| Action             | Command                              | Shortcut (just)   |
| ------------------ | ------------------------------------ | ----------------- |
| Start              | `docker compose up -d`               | `just up`         |
| Stop               | `docker compose down`                | `just down`       |
| Restart            | `docker compose restart postgres`    | `just restart`    |
| Logs               | `docker compose logs -f postgres`    | `just logs`       |
| Database shell     | `docker exec -it local-postgres psql -U postgres` | `just psql` |
| Status             | `docker compose ps`                  | `just status`     |
| Stop & remove      | `docker compose down`                | `just clean`      |
| Reset (wipe data)  | `docker compose down --volumes`      | `just reset`      |

## 🔌 Connecting from an Application

| Field    | Value         |
| -------- | ------------- |
| Host     | `localhost`   |
| Port     | `5432`        |
| Database | `postgres_db` |
| Username | `postgres`    |
| Password | `postgres`    |

Example connection string:

```
postgresql://postgres:postgres@localhost:5432/postgres_db
```

## 💾 Data Persistence

Database data is stored in the Docker named volume `postgres_data`, which is
mounted at `/var/lib/postgresql` (the PG 18 layout; data lives under
`/var/lib/postgresql/18/main`). The volume survives container restarts and
recreates.

## 🗑️ Reset Database

To start from a clean database, remove the container and its volume:

```sh
docker compose down -v
docker compose up -d
```

Or with `just`:

```sh
just reset
just up
```
