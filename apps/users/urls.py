from typing import List

from django.http import HttpRequest, JsonResponse
from django.urls import path


def me(_request: HttpRequest) -> JsonResponse:
    return JsonResponse({"me": None})


urlpatterns: List = [
    path("me/", me, name="users-me"),
]
