from . import base

DEBUG = True
DATABASES = base.DATABASES
INSTALLED_APPS = base.INSTALLED_APPS
EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"
