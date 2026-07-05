# core/admin.py
from django.contrib import admin
from .models import Module, Lesson, Progress, Question, QuizResult, Lab, RedFlag, LabResult, Certificate

class LessonInline(admin.TabularInline):#inside mod page and in agrid
    model = Lesson
    extra = 1 #add 1 extra row for new less

class QuestionInline(admin.TabularInline):
    model = Question
    extra = 1

class RedFlagInline(admin.TabularInline):
    model = RedFlag
    extra = 1

@admin.register(Module)
class ModuleAdmin(admin.ModelAdmin):
    list_display = ('code', 'title', 'order')
    inlines = [LessonInline, QuestionInline]#add this models to the module admin page

@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('title', 'module', 'order') #list view in this order

@admin.register(Progress)
class ProgressAdmin(admin.ModelAdmin):
    list_display = ('user', 'lesson', 'completed', 'updated_at')

@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('text', 'module', 'correct_option')

@admin.register(QuizResult)
class QuizResultAdmin(admin.ModelAdmin):
    list_display = ('user', 'module', 'score_percentage', 'passed', 'submitted_at')

@admin.register(Lab)
class LabAdmin(admin.ModelAdmin):
    list_display = ('title', 'module')
    inlines = [RedFlagInline]

@admin.register(RedFlag)
class RedFlagAdmin(admin.ModelAdmin):
    list_display = ('label', 'lab', 'is_true_red_flag')

@admin.register(LabResult)
class LabResultAdmin(admin.ModelAdmin):
    list_display = ('user', 'lab', 'score_percentage')

@admin.register(Certificate)
class CertificateAdmin(admin.ModelAdmin):
    list_display = ('user', 'issued_date')