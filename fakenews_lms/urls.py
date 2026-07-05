# fakenews_lms/urls.py
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    # path to djangos built-in authentication URLs(login,logout)
    path('accounts/', include('django.contrib.auth.urls')),
    
    #paths from my core app
    path('', include('core.urls')), 
]