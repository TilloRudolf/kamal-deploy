import datetime

from django.http import JsonResponse
from django.views import View

startDate = datetime.datetime.now()
version = "0.1.1"

class HealthCheckView(View):
    def get(self, request, *args, **kwargs):
        # Add any additional checks here (e.g., database connectivity)
        return JsonResponse({"status": "ok", "start-time": startDate, "version": version}, status=200)
