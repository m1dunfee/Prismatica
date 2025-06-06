# backend/Dockerfile
# ──────────────────────────────────────────────────────────────────────────────
# 1) Use a lightweight Python image
FROM python:3.10-slim

# 2) Create and switch to /app
WORKDIR /app

# 3) Install any OS-level dependencies (e.g. for psycopg2)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
       build-essential \
       libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# 4) Copy only requirements.txt first (leverage layer cache)
COPY requirements.txt .

# 5) Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# 6) Copy the rest of the Django project code
#    (this will include manage.py and the prismatica/ folder plus any Django apps)
COPY . .

# 7) Ensure Django’s “collectstatic” will go into a folder named /app/staticfiles
#    (you can skip this if you’re not using collectstatic or if you’ll handle it in CI)
# RUN python manage.py collectstatic --noinput

# 8) By default, run nothing—each service in docker-compose will override CMD
CMD ["/bin/bash"]
