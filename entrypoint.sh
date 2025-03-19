#!/bin/bash
set -e

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