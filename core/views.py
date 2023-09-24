from django.db import connection
from django.http import JsonResponse
from django.shortcuts import render


# Create your views here.
def health_check(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")

        return JsonResponse({"status": "ok"})
    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)})
