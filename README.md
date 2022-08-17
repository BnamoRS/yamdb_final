# Проект yamdb_final

![example workflow](https://github.com/bnamors/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)

**Workflow** для проекта **api_yamdb**

При `git push` проекта на **Git Hub** настроен  **CI/CD**:
- автоматическое тестирование кода тестами pytest и проверка линтером flake8;
- создается образ yamdb_web и пушится на Docker Hub;
- проект **api_yamdb** автоматически деплоится на сервер;
- при успешном прохождении всех этапов отправляется сообщение в Telegram.

Описание проекта **api_yamdb** доступно по ссылке: [Проект api_yamdb](https://github.com/BnamoRS/api_yamdb "Посмотреть описание проекта api_yamdb")

IP адрес, по которому доступен [развернутый проект](http://51.250.27.62/)

## Зависимости:

- requests==2.26.0
- django==2.2.16
- djangorestframework==3.12.4
- PyJWT==2.1.0
- pytest==6.2.4
- pytest-django==4.4.0
- pytest-pythonpath==0.7.3
- djangorestframework-simplejwt==5.1.0

## Установка:

Войти на удаленный сервер в облаке;
- остановить службу nginx:
	`sudo systemctl stop nginx` 
- установить docker:
	`sudo apt install docker.io`
- установить [docker-compose](https://docs.docker.com/compose/install/)
- скопировать файлы `docker-compose.yaml` и `nginx/default.conf` на сервер в `home/<username>/docker-compose.yaml` и `home/<username>/nginx/default.conf` соответственно.
- добавить в Secrets GitHub Actions переменные окружения для работы базы данных

- на сервере выполнить миграции:
	- войти в терминал контейнера yamdb-web-1:
		`sudo docker exec -it bnamors_web_1 bash`
	- выполнить команды:
		```
		python manage.py migrate
		python manage.py collectstatic
		```
	- создать суперпользователя комндой:
		```
		python manage.py createsuperuser
		```
	- выйти из терминала командой:
		```
		exit
		```

После выполнения данных команд по адресу `ip-server/admin/` будет доступна панель администратора.

## Описание переменных окружения:

- `DB_ENGINE=django.db.backends.postgresql` -  Указание, что используется postgresql;
- `DB_NAME=postgres` - имя базы данных;
- `POSTGRES_USER=postgres` - пользователь базы данных;
- `POSTGRES_PASSWORD=postgres` - пароль базы данных;
- `DB_HOST=db` - host базы данных;
- `DB_PORT=5432` - порт базы данных;
- `SECRET_KEY=p&l*******************(vs` - секретный ключ Django;
- `COMPOSE_PROJECT_NAME=yamdb` - имя проекта.

## Развернуть проект локально через docker:

- Установить `docker` и `docker-compose`;
- из директории с `Dockerfile`  `.../yamdb_final/api_yamdb` запустить команду:
	```
	sudo docker -t bnamors/yamdb_web build .
	```
- в директории  `.../yamdb/infra/` создать файл `.env` с переменными окружения;
- из директории `.../yamdb/infra/` выполнить команду:
	```
	sudo docker-compose up -d
	```

## Автор:

***Роман Буцких***
