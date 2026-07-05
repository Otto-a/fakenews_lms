# core/urls.py
from django.urls import path #def url routes
from . import views #from curr app

urlpatterns = [
    path('', views.home, name='home'),  # public landing page
    path('register/', views.register_user, name='register'),  # sign up page
    path('dashboard/', views.dashboard, name='dashboard'),  # student portal
    path('modules/', views.module_list, name='module_list'),
    path('lessons/<int:lesson_id>/', views.lesson_detail, name='lesson_detail'),#lesson/1
    path('modules/<int:module_id>/quiz/', views.quiz_detail, name='quiz_detail'),
    path('modules/<int:module_id>/lab/', views.lab_exercise, name='lab_exercise'),
    path('certificates/', views.certificates_view, name='certificates'),
    path('analytics/', views.analytics_view, name='analytics'),
    path('labs/', views.lab_list, name='lab_list'),
]