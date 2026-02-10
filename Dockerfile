FROM python:3.12-slim

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID appuser \
 && useradd -m -u $UID -g $GID appuser

# for psycopg2
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Создаем директорию как в docker-compose.yml
WORKDIR /app

# copying dependencies
COPY pyproject.toml .

# installations
RUN pip install --upgrade pip && \
    pip install .

# copying project
COPY . .

EXPOSE 8000

# manage.py
WORKDIR /app/project8sem