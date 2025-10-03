## n8n on Railway

This repo provides a Railway-friendly deployment for n8n using a `Dockerfile`. It also keeps a local `docker-compose.yml` for development.

### What Railway will create
- A service built from `Dockerfile`
- A Postgres database (Railway plugin)
- A Volume mounted at `/home/node/.n8n` for persistent data

### Environment variables (set in Railway)
Set these in the Railway service Variables. Replace values as needed and take the Postgres ones from Railway's database plugin.

Required:
- `N8N_PROTOCOL`: `https`
- `N8N_HOST`: your Railway domain (e.g. `your-app.up.railway.app`)
- `WEBHOOK_URL`: `https://your-app.up.railway.app`
- `N8N_PORT`: `${PORT}` (Railway-provided var)
- `NODE_ENV`: `production`
- `N8N_ENCRYPTION_KEY`: long random secret for credential encryption
- `DB_TYPE`: `postgresdb`
- `POSTGRES_HOST`, `POSTGRES_PORT`, `POSTGRES_DATABASE`, `POSTGRES_USER`, `POSTGRES_PASSWORD`

Optional security/convenience:
- `N8N_BASIC_AUTH_ACTIVE`: `true`
- `N8N_BASIC_AUTH_USER`: `admin`
- `N8N_BASIC_AUTH_PASSWORD`: strong password
- `N8N_DIAGNOSTICS_ENABLED`: `false`
- `N8N_VERSION_NOTIFICATIONS_ENABLED`: `false`

### Deploy to Railway
1. Create a new Railway project.
2. Add a Postgres database (Plugin → Postgres). Copy its credentials.
3. Add a new service from this repo (Docker).
4. Create a Volume and mount it at `/home/node/.n8n`.
5. Set the Environment Variables listed above (use `${PORT}` for `N8N_PORT`).
6. Deploy. After deploy, open the app URL and log in via basic auth if enabled.

### Local development
Use `docker-compose` locally. Create a `.env` with the variables in `.env.example` (not committed).

```
docker compose up -d
```

Notes:
- `docker-compose.yml` relies on environment variables for Postgres. Point them at your local DB.
- The `~/.n8n:/home/node/.n8n` bind mount persists credentials locally.


