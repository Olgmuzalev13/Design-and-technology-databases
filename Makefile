# Локальная разработка без Docker используется с предварительно запущенной базой данных, рекомендуется в процессе разработки
local:
	python3 ./project8sem/manage.py makemigrations
	python3 ./project8sem/manage.py migrate
	python3 ./project8sem/manage.py runserver

# Сборка и запуск только сервиса db из docker-compose.yml
db:
	docker compose up --build db

# Полный запуск всех сервисов через Docker Compose с пересборкой, рекомендуется на финальных этапах каждого семинара
compose:
	docker compose up --build

# Запуск тестов и генерация отчетов о покрытии кода
tests:
	coverage run ./project8sem/manage.py test
	coverage report
	coverage html

# Проверка кода на соответствие стилю и стандартам - нужна чтобы пройти precommit проверку
lint:
	flake8 project8sem

# Просмотр логов веб-сервиса в реальном времени
logs:
	docker compose logs -f web

# Запуск всех сервисов через Docker Compose без пересборки (рекомендуется все таки пересобирать)
up:
	docker compose up

# Остановка всех сервисов и удаление volumes
down:
	docker compose down -v