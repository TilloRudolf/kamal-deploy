#!/bin/bash
set -e

if [ "$RUN_ENTRYPOINT" = "true" ]; then
    echo "Executing entrypoint script..."
    # Main process
#    exec "$@"
    exec "python manage.py migrate"
else
    echo "Skipping entrypoint execution."
#    exec "$@"  # Start container normally
fi