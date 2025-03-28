#!/bin/bash
set -e

echo "Kamal version: "
echo $KAMAL_VERSION
echo "Env file: "
echo @ENV_FILE

if [ "$RUN_ENTRYPOINT" = "true" ]; then
    echo "Executing entrypoint script..."
    # Main process
#    exec "python manage.py migrate"
    python manage.py migrate
    exec "$@"
else
    echo "Skipping entrypoint execution."
    exec "$@"  # Start container normally
fi