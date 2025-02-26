FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY /test /app/test/.
COPY manage.py /app/.

EXPOSE 8000
#EXPOSE 80

# Define the health check
HEALTHCHECK --interval=10s --timeout=5s --retries=3 --start-period=10s \
#  CMD curl -f http://localhost:80/health || exit 1
  CMD curl -f http://localhost:8000/health || exit 1

CMD ["python", "manage.py", "runserver"]
#CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]