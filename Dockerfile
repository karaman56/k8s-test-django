FROM python:3.12-slim

# Аргумент для сборки (временный SECRET_KEY)
ARG SECRET_KEY=dummy_for_build
ENV SECRET_KEY=${SECRET_KEY}

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY backend_main_django/src/ .

RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "webapp.wsgi:application"]