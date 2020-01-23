# импортировать базовый образ (slim-версия)

FROM python:3.7-slim

# используем команду ENV для установки двух переменных сред:

# гарантирует, что наш консольный вывод выглядит знакомым и Docker не буферизуется, чего мы не хотим
ENV PYTHONDONTWRITEBYTECODE 1

# Python не будет пытаться писать .pyc файлы, которые мы также не желаем
ENV PYTHONUNBUFFERED 1

# путь к рабочему каталогу по умолчанию
WORKDIR /code

# используем Pipenv, поэтому копируем файлы Pipfile и Pipfile.lock в каталог / code / в Docker.
COPY Pipfile Pipfile.lock /code/
RUN  pip install pipenv && pipenv install --system

# Copy project
COPY . /code/