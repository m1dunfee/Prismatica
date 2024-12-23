# Base image with Python
FROM python:3.10-slim
# Set environment variables
# Prevents Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1  
# Ensures stdout/stderr are flushed
ENV PYTHONUNBUFFERED=1         
# Set working directory inside the container
WORKDIR /app
# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Copy the project code into the container
COPY . .
# Expose the port Django will run on
EXPOSE 8000
# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]