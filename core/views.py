# core/views.py
import json
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.models import User

from .forms import RegisterForm
from .models import (
    UserProfile, Module, Lesson, UserLessonProgress,
    QuizQuestion, QuizSubmission, LabExercise, LabRedFlag, LabSubmission, Certificate
)

def home(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    return render(request, 'core/home.html', {'modules': Module.objects.all().order_by('order')})

def register_user(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
        
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            UserProfile.objects.create(user=user)
            login(request, user)
            return redirect('dashboard')
    else:
        form = RegisterForm()
        
    return render(request, 'registration/register.html', {'form': form})

@login_required
def dashboard(request):
    user = request.user
    modules = Module.objects.all().order_by('order')
    
    learning_path = []
    completed_count = 0

    for m in modules:
        total_lessons = m.lessons.count()
        completed_lessons = UserLessonProgress.objects.filter(user=user, lesson__module=m, completed=True).count()
        progress_pct = int((completed_lessons / total_lessons) * 100) if total_lessons > 0 else 0
        
        passed_quiz = QuizSubmission.objects.filter(user=user, module=m, passed=True).exists()

        if m.order == 1:
            prev_passed = True
        else:
            prev_module = Module.objects.filter(order=m.order - 1).first()
            prev_passed = QuizSubmission.objects.filter(user=user, module=prev_module, passed=True).exists() if prev_module else False

        if not prev_passed:
            status = 'locked'
        elif passed_quiz:
            status = 'completed'
            completed_count += 1
            progress_pct = 100
        else:
            status = 'active'

        learning_path.append({'module': m, 'status': status, 'progress': progress_pct})

    submissions = QuizSubmission.objects.filter(user=user)
    total_score = sum(s.score_percentage for s in submissions)
    quiz_avg = (total_score / submissions.count()) if submissions.exists() else 0.0

    return render(request, 'core/dashboard.html', {
        'enrolled_count': modules.count(),
        'completed_count': completed_count,
        'quiz_avg': round(quiz_avg, 1),
        'learning_path': learning_path,
    })

@login_required
def module_list(request):
    user = request.user
    modules = Module.objects.all().order_by('order')
    modules_data = []

    for m in modules:
        if m.order == 1:
            is_unlocked = True
        else:
            prev_m = Module.objects.filter(order=m.order - 1).first()
            is_unlocked = QuizSubmission.objects.filter(user=user, module=prev_m, passed=True).exists() if prev_m else False

        completed = QuizSubmission.objects.filter(user=user, module=m, passed=True).exists()

        modules_data.append({
            'module': m,
            'lessons_count': m.lessons.count(),
            'is_unlocked': is_unlocked,
            'completed': completed,
            'in_progress': is_unlocked and not completed
        })

    return render(request, 'core/modules.html', {'modules_data': modules_data})

@login_required
def lesson_detail(request, lesson_id):
    user = request.user
    lesson = get_object_or_404(Lesson, id=lesson_id)
    module = lesson.module

    if module.order > 1:
        prev_m = Module.objects.filter(order=module.order - 1).first()
        if not (prev_m and QuizSubmission.objects.filter(user=user, module=prev_m, passed=True).exists()):
            return redirect('module_list')

    UserLessonProgress.objects.get_or_create(user=user, lesson=lesson, defaults={'completed': True})

    lessons_list = module.lessons.all().order_by('order')
    lessons_data = []
    completed_lessons_count = 0
    
    for l in lessons_list:
        completed = UserLessonProgress.objects.filter(user=user, lesson=l, completed=True).exists()
        if completed:
            completed_lessons_count += 1
        lessons_data.append({'lesson': l, 'completed': completed, 'active': l.id == lesson.id})

    return render(request, 'core/lesson_detail.html', {
        'lesson': lesson,
        'module': module,
        'lessons_data': lessons_data,
        'next_lesson': lessons_list.filter(order__gt=lesson.order).first(),
        'completed_lessons_count': completed_lessons_count,
        'total_lessons_count': len(lessons_data),
    })

@login_required
def quiz_detail(request, module_id):
    user = request.user
    module = get_object_or_404(Module, id=module_id)
    questions = module.quiz_questions.all()

    if request.method == "POST" and "retake" in request.POST:
        QuizSubmission.objects.filter(user=user, module=module).delete()
        return redirect('quiz_detail', module_id=module.id)

    submission = QuizSubmission.objects.filter(user=user, module=module).order_by('-submitted_at').first()

    if request.method == "POST" and not submission:
        correct_count = sum(1 for q in questions if request.POST.get(f"question_{q.id}") == q.correct_option)
        score = (correct_count / questions.count()) * 100 if questions.exists() else 0
        
        QuizSubmission.objects.create(user=user, module=module, score_percentage=score, passed=(score >= 80.0))

        if not Module.objects.exclude(quizsubmission__user=user, quizsubmission__passed=True).exists():
            Certificate.objects.get_or_create(user=user)

        return redirect('quiz_detail', module_id=module.id)

    return render(request, 'core/quiz_detail.html', {
        'module': module,
        'questions': questions,
        'submission': submission,
        'next_module': Module.objects.filter(order__gt=module.order).first()
    })

@login_required
def lab_list(request):
    return render(request, 'core/lab_list.html', {'labs': LabExercise.objects.all()})

@login_required
def lab_exercise(request, module_id):
    user = request.user
    module = get_object_or_404(Module, id=module_id)
    lab = get_object_or_404(LabExercise, module=module)
    red_flags = lab.red_flags.all()
    submission = LabSubmission.objects.filter(user=user, lab=lab).first()

    if request.method == "POST" and not submission:
        selected_ids = [int(x) for x in request.POST.getlist('flags')]
        true_flags = red_flags.filter(is_true_red_flag=True)
        matched = sum(1 for f in true_flags if f.id in selected_ids)
        
        score = (matched / true_flags.count()) * 100 if true_flags.exists() else 0
        
        sub = LabSubmission.objects.create(user=user, lab=lab, score_percentage=score)
        sub.selected_flags.set(selected_ids)
        return redirect('lab_exercise', module_id=module.id)

    return render(request, 'core/lab_exercise.html', {
        'lab': lab,
        'red_flags': red_flags,
        'submission': submission,
        'module': module
    })

@login_required
def certificates_view(request):
    return render(request, 'core/certificates.html', {
        'earned_badges': Module.objects.filter(quizsubmission__user=request.user, quizsubmission__passed=True).distinct(),
        'certificate': Certificate.objects.filter(user=request.user).first()
    })

@staff_member_required(login_url='dashboard')
def analytics_view(request):
    students = User.objects.filter(is_staff=False).order_by('date_joined')
    total_active_students = students.count()

    # Chart 1: Enrollment over time
    month_counts = {}
    month_order = []
    for s in students:
        month_name = s.date_joined.strftime('%B %Y') if s.date_joined else "Unknown"
        if month_name not in month_counts:
            month_counts[month_name] = 0
            month_order.append(month_name)
        month_counts[month_name] += 1

    # Chart 2: Module completions
    modules = Module.objects.all()
    module_labels = []
    completion_counts = []
    total_completions = 0

    for m in modules:
        module_labels.append(m.code)
        completions = QuizSubmission.objects.filter(module=m, passed=True).values('user').distinct().count()
        total_completions += completions
        completion_counts.append(int((completions / total_active_students) * 100) if total_active_students > 0 else 0)

    global_completion_rate = int((total_completions / (total_active_students * modules.count())) * 100) if total_active_students > 0 and modules.exists() else 0

    # Student Data Table
    filter_status = request.GET.get('status', 'all')
    search_query = request.GET.get('q', '').lower()
    students_data = []

    for s in students:
        if search_query and search_query not in s.username.lower() and search_query not in s.first_name.lower():
            continue
            
        status = 'Certified' if Certificate.objects.filter(user=s).exists() else 'Active'
        if filter_status == 'certified' and status != 'Certified':
            continue
        elif filter_status == 'active' and status != 'Active':
            continue

        subs = QuizSubmission.objects.filter(user=s)
        avg_score = (sum(sub.score_percentage for sub in subs) / subs.count()) if subs.exists() else 0.0

        students_data.append({
            'student': s,
            'completed_count': subs.filter(passed=True).count(),
            'avg_score': round(avg_score, 1),
            'status': status
        })

    all_subs = QuizSubmission.objects.all()
    global_quiz_avg = (sum(s.score_percentage for s in all_subs) / all_subs.count()) if all_subs.exists() else 0.0

    return render(request, 'core/analytics.html', {
        'total_enrollments': total_active_students,
        'global_completion_rate': global_completion_rate,
        'global_quiz_avg': round(global_quiz_avg, 1),
        'certified_students_count': Certificate.objects.count(),
        'students_data': students_data[:5] if not search_query and filter_status == 'all' else students_data,
        'enrollment_months': json.dumps(month_order),
        'enrollment_counts': json.dumps([month_counts[m] for m in month_order]),
        'module_labels': json.dumps(module_labels),
        'completion_counts': json.dumps(completion_counts),
        'filter_status': filter_status,
        'search_query': search_query,
    })