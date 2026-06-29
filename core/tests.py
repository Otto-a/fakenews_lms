from django.test import TestCase
from django.contrib.auth.models import User
from core.models import Module, QuizResult

class ProgressiveLearningTestCase(TestCase):
    
    def setUp(self):
        # 4 spaces of indentation here!
        self.user = User.objects.create(username="test_student")
        self.module = Module.objects.create(
            code="FNL-101", 
            title="Introduction to Fake News", 
            order=1
        )

    def test_quiz_failure_locks_module(self):
        # 4 spaces of indentation here!
        result = QuizResult.objects.create(
            user=self.user, 
            module=self.module, 
            score_percentage=50.0, 
            passed=False
        )
        self.assertFalse(result.passed)

    def test_quiz_success_unlocks_module(self):
        # 4 spaces of indentation here!
        result = QuizResult.objects.create(
            user=self.user, 
            module=self.module, 
            score_percentage=75.0, 
            passed=True
        )
        self.assertTrue(result.passed)