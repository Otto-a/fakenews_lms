# core/admin.py
from django.contrib import admin
from .models import (
    UserProfile, Module, Lesson, UserLessonProgress, 
    QuizQuestion, QuizSubmission, LabExercise, LabRedFlag, LabSubmission
)

# Inlines make editing related items much easier in the admin panel
class LessonInline(admin.TabularInline):
    model = Lesson
    extra = 1

class QuizQuestionInline(admin.TabularInline):
    model = QuizQuestion
    extra = 1

class LabRedFlagInline(admin.TabularInline):
    model = LabRedFlag
    extra = 1

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user',)
    search_fields = ('user__username', 'user__email')

@admin.register(Module)
class ModuleAdmin(admin.ModelAdmin):
    list_display = ('code', 'title', 'order')
    search_fields = ('code', 'title')
    inlines = [LessonInline, QuizQuestionInline]

@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('title', 'module', 'order')
    list_filter = ('module',)
    search_fields = ('title',)

@admin.register(UserLessonProgress)
class UserLessonProgressAdmin(admin.ModelAdmin):
    list_display = ('user', 'lesson', 'completed', 'updated_at')
    list_filter = ('completed', 'lesson__module')

@admin.register(QuizQuestion)
class QuizQuestionAdmin(admin.ModelAdmin):
    list_display = ('text', 'module', 'correct_option')
    list_filter = ('module',)

@admin.register(QuizSubmission)
class QuizSubmissionAdmin(admin.ModelAdmin):
    list_display = ('user', 'module', 'score_percentage', 'passed', 'submitted_at')
    list_filter = ('passed', 'module')

@admin.register(LabExercise)
class LabExerciseAdmin(admin.ModelAdmin):
    list_display = ('title', 'module', 'article_headline')
    inlines = [LabRedFlagInline]

@admin.register(LabRedFlag)
class LabRedFlagAdmin(admin.ModelAdmin):
    list_display = ('label', 'lab', 'is_true_red_flag')
    list_filter = ('is_true_red_flag', 'lab')

@admin.register(LabSubmission)
class LabSubmissionAdmin(admin.ModelAdmin):
    list_display = ('user', 'lab', 'score_percentage', 'submitted_at')