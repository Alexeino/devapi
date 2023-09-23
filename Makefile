export DATABASE_NAME=<your_db>
export DATABASE_USER=
export DATABASE_PASSWORD=
export DATABASE_HOST=

PROJECT_NAME = devapi
PYTHON = python3
VENV_DIR = env

migrations:
	$(PYTHON) manage.py makemigrations

migrate:
	$(PYTHON) manage.py migrate

run/devserver:
	$(PYTHON) manage.py runserver

clean:
	@rm -rf db.sqlite3

create-app:
	$(PYTHON) manage.py startapp $(name)

freeze:
	pip freeze > requirements.txt

format:
	@isort . -s env/
	@black --exclude env/ .