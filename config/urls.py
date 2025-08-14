from typing import List

from django.contrib import admin
from django.http import HttpRequest, JsonResponse
from django.urls import include, path


def health_check(_request: HttpRequest) -> JsonResponse:
    return JsonResponse({"status": "ok"})


urlpatterns: List = [
    path("admin/", admin.site.urls),
    path("health/", health_check, name="health"),
    path("api/users/", include("apps.users.urls")),
]
