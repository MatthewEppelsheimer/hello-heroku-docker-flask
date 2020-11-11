# Usage

```bash
$ HELLO_PYTHON_HEROKU_NAME=<your heroku app name>
$ export HELLO_PYTHON_HEROKU_NAME

# Create your heroku app, clone app files
$ sh ./setup_heroku.sh

# Build the container, push it to Heroku's registry,
# and trigger a Heroku release
sh ./deploy_heroku.sh
```

