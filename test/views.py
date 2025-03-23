import datetime
import os
import uuid

from django.http import JsonResponse
from django.views import View

startDate = datetime.datetime.now()
# version = "0.1.2"
marker = uuid.uuid4()

class HealthCheckView(View):
    def get(self, request, *args, **kwargs):
        # Add any additional checks here (e.g., database connectivity)
        version = os.getenv("KAMAL_VERSION")
        return JsonResponse({"status": "ok", "start-time": startDate, "version": version, "marker": marker}, status=200)
