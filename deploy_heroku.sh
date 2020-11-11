#!/usr/bin/env bash
set -e
set -o pipefail

docker build --tag hello_python -f Dockerfile ./

docker tag hello_python registry.heroku.com/mle-hello-python/web
docker push registry.heroku.com/mle-hello-python/web
heroku container:release --app $HELLO_PYTHON_HEROKU_NAME web

echo "\n\nDone. It may take a few seconds for the server to fully startup.\n\nAccess the API from https://${HELLO_PYTHON_HEROKU_NAME}.herokuapp.com/\nTry \`curl https://${HELLO_PYTHON_HEROKU_NAME}.herokuapp.com/hello\`\n "and \`curl https://${HELLO_PYTHON_HEROKU_NAME}.herokuapp.com/healthz\`"

