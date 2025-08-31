# Luxury Platform

Luxury Platform is a high-end web application built with Django, following enterprise-level best practices. The architecture includes a Django backend (Gunicorn), PostgreSQL database, Redis cache & broker, Celery workers for background tasks, and optionally MinIO for object storage. All services are orchestrated with Docker Compose for reproducibility and scalability:contentReference[oaicite:10]{index=10}:contentReference[oaicite:11]{index=11}.

## Architecture

- **Django (Gunicorn)** – main web application.
- **PostgreSQL** – primary database.
- **Redis** – caching and Celery message broker.
- **Celery & Celery Beat** – asynchronous and scheduled task processors.
- **Nginx** – reverse proxy serving static files and proxying requests.
- **MinIO (optional)** – S3-compatible storage for media/static files.

## Environment Variables

Configure the following variables in a `.env` file (copy from `.env.example`):

- `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_HOST`, `DB_PORT`
- `REDIS_HOST`, `REDIS_PORT`
- `DJANGO_SECRET_KEY`
- `MINIO_ROOT_USER`, `MINIO_ROOT_PASSWORD`, `MINIO_BUCKET_NAME` (for MinIO)

These settings keep secrets out of code and loaded via `python-dotenv`:contentReference[oaicite:12]{index=12}.

## Development Setup

1. Copy `.env.example` to `.env` and fill in your values.
2. Build and start services with Docker Compose:
   ```bash
   docker compose -f docker-compose.dev.yml up --build
