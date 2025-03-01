проект нацелен на автоматизацию сборки и деплоя фронтенд-приложения с использованием Docker и GitHub Actions
Структура проекта:

project/
├── task/
│   └── frontend/
│       ├── src/              
│       ├── public/           
│       ├── package.json       
│       ├── Dockerfile         # Dockerfile для сборки образа
│       └── ...               
├── docker-compose.yml         # Docker Compose конфигурация
├── nginx.conf                 # Конфигурация Nginx
└── .github/
    └── workflows/
        └── ci-cd.yml          # GitHub Actions workflow

Процесс начинается с того, что на стадии build GitHub Actions собирает Docker-образ из Dockerfile.
Образ помечается тегом my-image:latest.
На стадии deploy приложение разворачивается в контейнере с помощью docker-compose на локальном хосте, контейнер доступен по порту 80(можно проверить во время выполнения делплоя)

также можно копировать репозиторий и запустить локально.
