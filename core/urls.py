from django.urls import include, path

from .views import health_check

urlpatterns = [path("health", health_check, name="health_check")]
