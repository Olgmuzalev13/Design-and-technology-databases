local:
	python3 ./project8sem/manage.py makemigrations
	python3 ./project8sem/manage.py migrate
	python3 ./project8sem/manage.py runserver

build:
	docker compose up --build


tests:
	coverage run ./project8sem/manage.py test
	coverage report
	coverage html

lint:
	flake8 project8sem

logs:
	docker compose logs -f web

up:
	docker compose up

down:
	docker compose down -v