# core/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),  # Public Landing Page
    path('register/', views.register_user, name='register'),  # Sign Up Page
    path('dashboard/', views.dashboard, name='dashboard'),  # Student Portal
    path('modules/', views.module_list, name='module_list'),
    path('lessons/<int:lesson_id>/', views.lesson_detail, name='lesson_detail'),
    path('modules/<int:module_id>/quiz/', views.quiz_detail, name='quiz_detail'),
    path('modules/<int:module_id>/lab/', views.lab_exercise, name='lab_exercise'),
    path('certificates/', views.certificates_view, name='certificates'),
    path('analytics/', views.analytics_view, name='analytics'),
    path('labs/', views.lab_list, name='lab_list'),
]