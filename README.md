# Demo messenger

## Description

Посмотреть 
https://dartservice.ru/#/

Подробнее о настройке и запуске
https://habr.com/ru/company/surfstudio/blog/511880/

## Tooling

### autocanon

Нагрузочное тестирование
<https://github.com/mcollina/autocannon#install>

```sh  

# Установка 
npm i autocannon -g

# Запуск (100 соединений 60 секунд) 
autocannon -c 100 -d 60 http://localhost:80/api/actuator

```

### artillery

Нагрузочное тестирование
<https://artillery.io/docs/guides/guides/ws-reference.html>

```sh  
# Установка 
npm install artillery -g

# Запуск 
artillery run test/ws_ping_prod.yaml

```  

### Aqueduct

```sh  
# Установка 
pub global activate aqueduct 4.0.0-b1

# Удаление 
pub global deactivate aqueduct

# Создать новое приложение 
aqueduct create data_app

# Запуск JIT 
aqueduct serve --port 8080 --isolates 2

# AOT сборка 
aqueduct build

# Запуск AOT 
data_app.aot --port 8080 --isolates 2

# Создать файл миграции БД 
aqueduct db generate

# Применить файл миграции 
docker-compose -f docker-compose.migrations.yaml --env-file=./env/data_app.env --compatibility up --abort-on-container-exit

# Применить файл миграции бд авторизации
docker-compose -f docker-compose.migrations_auth.yaml --env-file=./env/auth_app.env --compatibility up --abort-on-container-exit

# Сборка нативных артефактов 
(docker-compose -f docker-compose.dev.build.yaml up --build && cd gate && pub get && cd ..)

# Права на исполнение 
chmod +x ./gate/tst_msg.aot
```

### Запуск отладки

```sh  

# JIT 
docker-compose -f docker-compose.yaml -f docker-compose.dev.jit.yaml up --build -d

# AOT 
docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up --build -d

# Url
ws://localhost:8888/ws

```

### Dev

```sh  

# Генерация графа DI контейнера 

pub run build_runner watch --delete-conflicting-outputs

```

## API

### Auth

```sh
# Регистрация
POST https://dartservice.ru/auth/signup
{
    "name": "userName"
}
```

``` sh
# Авторизация
POST https://dartservice.ru/auth/signin
{
    "name": "userName"
}
```

``` sh
# Обновление токена
POST https://dartservice.ru/auth/refresh
headers:
{
    "Authorization": "<refreshToken>",
}
```

### Data

``` sh
# Заголовки каналов (название и последнее сообщение)
GET https://dartservice.ru/messenger/channel
headers:
{
    "Authorization": "Bearer <access>"
}
```

``` sh
# Список сообщений канала
GET https://dartservice.ru/messenger/channel/<channel name>
headers:
{
    "Authorization": "Bearer <access>"
}
```

``` sh
# Стрим сообщений
wss://dartservice.ru/messenger/ws

```
