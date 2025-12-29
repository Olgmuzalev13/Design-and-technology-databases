up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

logs:
	docker-compose logs -f web

migrate:
	docker-compose exec web python manage.py migrate

makemigrations:
	docker-compose exec web python manage.py makemigrations

test:
	docker-compose exec web python manage.py test

lint:
	flake8 project8sem

format:
	docker-compose exec web black backend/

init:
	docker-compose build
	docker-compose up -d
	sleep 5
	echo "Проект запущен: http://localhost:8000"