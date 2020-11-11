FROM python:3.7.9-alpine

COPY ["./app/Pipfile", "./app/Pipfile.lock", "./app/server.py", "/app/"].

RUN adduser -D hello_python \
    && apk update \
    && apk add --no-cache bash \
    && cd ./app \
    && pip install pipenv \
    && pipenv install --system --deploy --ignore-pipfile

WORKDIR /app
USER hello_python

CMD pipenv run -v bash -c "export FLASK_APP=server.py && flask run --host=0.0.0.0 --port=${PORT}"

