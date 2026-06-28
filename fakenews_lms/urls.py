# fakenews_lms/urls.py
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    
    # Change 'core/' to '' to mount the app directly at the root address
    path('', include('core.urls')), 
]