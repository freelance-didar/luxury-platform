from django.urls import path
from django.http import JsonResponse

def me(_request):
    return JsonResponse({'me': None})

urlpatterns = [
    path('me/', me, name='users-me'),
]