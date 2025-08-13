from django.contrib import admin
from django.urls import path, include
from django.http import JsonResponse

def health_check(_request):
    return JsonResponse({'status': 'ok'})

urlpatterns = [
    path('admin/', admin.site.urls),
    path('health/', health_check, name='health'),
    path('api/users/', include('apps.users.urls')),
]
