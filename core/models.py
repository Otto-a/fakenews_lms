#core/models.py
import uuid
from django.db import models
from django.contrib.auth.models import User

class Module(models.Model):
    code = models.CharField(max_length=15, unique=True)
    title = models.CharField(max_length=200)
    description = models.TextField()
    order = models.PositiveIntegerField(default=1, unique=True)
    badge_name = models.CharField(max_length=100, default="Fake News Novice")

    class Meta:
        ordering = ['order']

    def __str__(self):
        return f"{self.code}: {self.title}"

class Lesson(models.Model):
    module = models.ForeignKey(Module, on_delete=models.CASCADE, related_name='lessons')
    title = models.CharField(max_length=200)
    content = models.TextField()
    video_url = models.URLField(blank=True, null=True)
    duration_minutes = models.PositiveIntegerField(default=10)
    order = models.PositiveIntegerField(default=1)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return f"{self.module.code} - Lesson {self.order}"

class Progress(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE)
    completed = models.BooleanField(default=False)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        unique_together = ('user', 'lesson')

class Question(models.Model):
    module = models.ForeignKey(Module, on_delete=models.CASCADE, related_name='questions')
    text = models.TextField()
    choice_a = models.CharField(max_length=255)
    choice_b = models.CharField(max_length=255)
    choice_c = models.CharField(max_length=255)
    choice_d = models.CharField(max_length=255)
    correct_option = models.CharField(max_length=1, choices=(('A', 'A'), ('B', 'B'), ('C', 'C'), ('D', 'D')))

class QuizResult(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    module = models.ForeignKey(Module, on_delete=models.CASCADE)
    score_percentage = models.FloatField()
    passed = models.BooleanField(default=False)
    submitted_at = models.DateTimeField(auto_now_add=True)

class Lab(models.Model):
    module = models.ForeignKey(Module, on_delete=models.CASCADE, related_name='labs')
    title = models.CharField(max_length=200)
    article_headline = models.CharField(max_length=255)
    article_meta = models.CharField(max_length=255)
    article_body = models.TextField()

    def __str__(self):
        return f"Lab: {self.title}"

class RedFlag(models.Model):
    lab = models.ForeignKey(Lab, on_delete=models.CASCADE, related_name='red_flags')
    label = models.CharField(max_length=255)
    is_correct = models.BooleanField(default=True) # changed

class LabResult(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    lab = models.ForeignKey(Lab, on_delete=models.CASCADE)
    selected_flags = models.ManyToManyField(RedFlag, blank=True)
    score_percentage = models.FloatField()
    submitted_at = models.DateTimeField(auto_now_add=True)

class Certificate(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='certificate')
    issued_date = models.DateField(auto_now_add=True)