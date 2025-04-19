# syntax=docker/dockerfile:1
FROM python:3.11-slim

# 1. Install system dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      netcat-openbsd \
      postgresql-client \
 && rm -rf /var/lib/apt/lists/*

# 2. Install Python dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

# 3. Copy project files (including manage.py)
COPY . .

# 4. Copy + permit our wait script
COPY wait-for-postgres.sh /wait-for-postgres.sh
RUN chmod +x /wait-for-postgres.sh

# 5. Entrypoint waits for Postgres, applies migrations, then runs
ENTRYPOINT ["/wait-for-postgres.sh"]