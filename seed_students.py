# seed_students.py
import datetime
from django.utils import timezone
from django.contrib.auth.models import User
from core.models import Module, Lesson, Progress, QuizResult, Lab, LabResult, Certificate

def populate_students():
    print("--- Starting Student Seeding for Analytics ---")

    # List of 13 student profiles with joining dates spread across 2025 and 2026
    students_data = [
        # NEW: 2025 historical data records
        {"username": "mwangi", "first": "Mwangi", "last": "Ngugi", "email": "mwangi@example.com", "year": 2025, "month": 10, "day": 12},
        {"username": "cherono", "first": "Cherono", "last": "Koech", "email": "cherono@example.com", "year": 2025, "month": 11, "day": 19},
        {"username": "nekesa", "first": "Nekesa", "last": "Nafula", "email": "nekesa@example.com", "year": 2025, "month": 12, "day": 24},
        
        # 2026 current data records
        {"username": "amara", "first": "Amara", "last": "Diallo", "email": "amara@example.com", "year": 2026, "month": 1, "day": 10},
        {"username": "fatima", "first": "Fatima", "last": "Al-Rashid", "email": "fatima@example.com", "year": 2026, "month": 2, "day": 15},
        {"username": "tendai", "first": "Tendai", "last": "Moyo", "email": "tendai@example.com", "year": 2026, "month": 3, "day": 5},
        {"username": "chidi", "first": "Chidi", "last": "Okafor", "email": "chidi@example.com", "year": 2026, "month": 3, "day": 20},
        {"username": "leila", "first": "Leila", "last": "Mensah", "email": "leila@example.com", "year": 2026, "month": 4, "day": 2},
        {"username": "wanjiku", "first": "Wanjiku", "last": "Kamau", "email": "wanjiku@example.com", "year": 2026, "month": 4, "day": 18},
        {"username": "otieno", "first": "Otieno", "last": "Omondi", "email": "otieno@example.com", "year": 2026, "month": 5, "day": 7},
        {"username": "abdi", "first": "Abdi", "last": "Ibrahim", "email": "abdi@example.com", "year": 2026, "month": 5, "day": 25},
        {"username": "halima", "first": "Halima", "last": "Yusuf", "email": "halima@example.com", "year": 2026, "month": 6, "day": 3},
        {"username": "james", "first": "James", "last": "Osei", "email": "james@example.com", "year": 2026, "month": 6, "day": 14},
    ]

    modules = list(Module.objects.all().order_by('order'))
    if len(modules) == 0:
        print("Error: Please run your 'seed_data.py' script first to populate modules.")
        return

    for idx, s in enumerate(students_data):
        user, created = User.objects.get_or_create(
            username=s["username"],
            defaults={
                "first_name": s["first"],
                "last_name": s["last"],
                "email": s["email"],
                "is_staff": False,
                "is_superuser": False
            }
        )
        if created:
            user.set_password("student123")
            join_date = timezone.make_aware(datetime.datetime(s["year"], s["month"], s["day"]))
            user.date_joined = join_date
            user.save()
            print(f"Created Student: {user.username}")
        else:
            print(f"Student exists: {user.username}")

        # Distribute varied progress levels realistically
        modules_to_complete = 5
        if idx in [2, 3, 4, 5]:
            modules_to_complete = 3
        elif idx in [6, 7, 8, 9]:
            modules_to_complete = 2
        elif idx in [10, 11, 12]:
            modules_to_complete = 1

        for i in range(modules_to_complete):
            m = modules[i]
            for l in m.lessons.all():
                Progress.objects.get_or_create(user=user, lesson=l, defaults={'completed': True})
            
            score = 100.0 if (idx + i) % 2 == 0 else 80.0
            QuizResult.objects.get_or_create(user=user, module=m, defaults={'score_percentage': score, 'passed': True})

            mlab = m.labs.first()
            if mlab:
                LabResult.objects.get_or_create(user=user, lab=mlab, defaults={'score_percentage': score})

        if modules_to_complete == 5:
            Certificate.objects.get_or_create(user=user)
            print(f"  -> Issued Program Certificate to {user.username}")

    print("\n--- Seeding Complete! 13 Students successfully populated ---")

if __name__ == "__main__":
    populate_students()