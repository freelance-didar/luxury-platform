FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash netcat-openbsd curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN python -m pip install --upgrade pip && pip install -r requirements.txt

COPY . /app/

RUN chmod +x infra/scripts/entrypoint.sh infra/scripts/wait-for-it.sh

ENTRYPOINT ["infra/scripts/entrypoint.sh"]
