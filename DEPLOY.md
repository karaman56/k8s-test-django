# Деплой Docker-образа Django-приложения

## Требования
- Установленный Docker
- Аккаунт на Docker Hub
- Выполнен `docker login`

## Сборка образа с версионированием (тег = хэш коммита)

```bash
docker build --build-arg SECRET_KEY=dummy -t karaman56/k8s-test-django:$(git rev-parse --short HEAD) .
```

Публикация образа на Docker Hub
```
docker push karaman56/k8s-test-django:$(git rev-parse --short HEAD)
```

