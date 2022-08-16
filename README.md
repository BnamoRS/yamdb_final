# Проект yamdb_final.

![example workflow](https://github.com/bnamors/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)

**Workflow** для проекта **api_yamdb**

При `git push` проекта на **Git Hub** настроен  CI/CD:
- автоматическое тестирование кода тестами pytest и проверка линтером flake8;
- создается образ yamdb_web и пушится на Docker Hub;
- проект **api_yamdb** автоматически деплоится на сервер;
- при успешном прохождении всех этапов отправляется сообщение в Telegram.

Описание проекта **api_yamdb** доступно по ссылке: [Проект api_yamdb](https://github.com/BnamoRS/api_yamdb "Посмотреть описание проекта api_yamdb")

## Зависимости:

- requests==2.26.0
- django==2.2.16
- djangorestframework==3.12.4
- PyJWT==2.1.0
- pytest==6.2.4
- pytest-django==4.4.0
- pytest-pythonpath==0.7.3
- djangorestframework-simplejwt==5.1.0

Дополнительно:

На сервере необходимо выполнить миграции:
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
- выйти из терминала:
	```
	exit
	```

После выполнения данных команд по адресу *ip-server/admin/* будет доступна панель администратора.
