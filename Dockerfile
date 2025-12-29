FROM python:3.12-slim

# for psycopg2
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# copying dependencies
COPY pyproject.toml .

# installations
RUN pip install --upgrade pip && \
    pip install .  # установит зависимости из pyproject.toml

# copying project
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]