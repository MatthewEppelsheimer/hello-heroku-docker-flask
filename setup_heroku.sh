#!/usr/bin/env bash
set -e
set -o pipefail

if [ ! ${HELLO_PYTHON_HEROKU_NAME} ]; then
    echo "Define and export a HELLO_PYTHON_HEROKU_NAME env variable, and re-run \sh ./setup.sh\`."
    exit 1
fi

if ! command -v heroku &> /dev/null; then
    echo "You need heroku command line tools installed."
    exit 1
fi

heroku container:login
rm -Rf ./app
git clone https://github.com/RideReport/infra_code_screen.git app
heroku create ${HELLO_PYTHON_HEROKU_NAME}

