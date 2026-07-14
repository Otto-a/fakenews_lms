# core/views.py
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.models import User
from django.db.models import Avg

from .forms import RegisterForm
from .models import Module, Lesson, Progress, Question, QuizResult, Lab, LabResult, Certificate

# check whether the next module is unlocked.
def is_unlocked(user, module):
    if module.order == 1:
        return True
    return QuizResult.objects.filter(user=user, module__order=module.order - 1, passed=True).exists() # Previous module must be passed first.

def home(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    return render(request, 'core/home.html') 

def register_user(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            login(request, form.save())
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
        total = m.lessons.count()
        done = Progress.objects.filter(user=user, lesson__module=m, completed=True).count()
        progress_pct = int((done / total) * 100) if total > 0 else 0
        # show  learner's progress for each module.
        
        passed_quiz = QuizResult.objects.filter(user=user, module=m, passed=True).exists()
        unlocked = is_unlocked(user, m)

        status = 'locked'
        if passed_quiz:
            status, completed_count, progress_pct = 'completed', completed_count + 1, 100
        elif unlocked:
            status = 'active'

        learning_path.append({'module': m, 'status': status, 'progress': progress_pct})

    quiz_avg = QuizResult.objects.filter(user=user).aggregate(Avg('score_percentage'))['score_percentage__avg'] or 0.0
    lab_results = LabResult.objects.filter(user=user)
    lab_total = sum(r.score_percentage for r in lab_results)
    lab_avg = (lab_total / len(lab_results)) if len(lab_results) > 0 else 0.0

    return render(request, 'core/dashboard.html', {
        'enrolled_count': modules.count(),
        'completed_count': completed_count,
        'quiz_avg': round(quiz_avg, 1), 'lab_avg': round(lab_avg, 1),
        'learning_path': learning_path,
    })

@login_required
def module_list(request):
    modules_data = []
    for m in Module.objects.all().order_by('order'):
        unlocked = is_unlocked(request.user, m)
        completed = QuizResult.objects.filter(user=request.user, module=m, passed=True).exists()
        # builds  list of modules shown on the page.
        modules_data.append({
            'module': m,
            'lessons_count': m.lessons.count(),
            'is_unlocked': unlocked,
            'completed': completed,
            'in_progress': unlocked and not completed
        })
    return render(request, 'core/modules.html', {'modules_data': modules_data})

@login_required
def lesson_detail(request, lesson_id):
    user = request.user
    lesson = get_object_or_404(Lesson, id=lesson_id)
    module = lesson.module

    if not is_unlocked(user, module):
        return redirect('module_list')

    # marks lesson as complete when it is opened.
    Progress.objects.get_or_create(user=user, lesson=lesson, defaults={'completed': True})

    lessons_list = module.lessons.all().order_by('order')
    lessons_data = []
    for l in lessons_list:
        completed = Progress.objects.filter(user=user, lesson=l, completed=True).exists()
        lessons_data.append({'lesson': l, 'completed': completed, 'active': l.id == lesson.id})

    completed_count = Progress.objects.filter(user=user, lesson__module=module, completed=True).count()

    return render(request, 'core/lesson_detail.html', {
        'lesson': lesson,
        'module': module,
        'lessons_data': lessons_data,
        'next_lesson': lessons_list.filter(order__gt=lesson.order).first(),
        'completed_lessons_count': completed_count,
        'total_lessons_count': len(lessons_data),
    })

@login_required
def quiz_detail(request, module_id):
    user = request.user
    module = get_object_or_404(Module, id=module_id)
    questions = module.questions.all()

    if request.method == "POST" and "retake" in request.POST:
        QuizResult.objects.filter(user=user, module=module).delete()
        return redirect('quiz_detail', module_id=module.id)

    submission = QuizResult.objects.filter(user=user, module=module).order_by('-submitted_at').first()

    if request.method == "POST" and not submission:
        correct_count = sum(1 for q in questions if request.POST.get(f"question_{q.id}") == q.correct_option)
        score = (correct_count / questions.count()) * 100 if questions.exists() else 0
        
        QuizResult.objects.create(user=user, module=module, score_percentage=score, passed=(score >= 60.0))

        # Give a certificate when all quizzes have been passed.
        passed_modules = Module.objects.filter(quizresult__user=user, quizresult__passed=True).distinct()
        if passed_modules.count() == Module.objects.count():
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
    return render(request, 'core/lab_list.html', {'labs': Lab.objects.all()})

@login_required
def lab_exercise(request, module_id):
    user = request.user
    module = get_object_or_404(Module, id=module_id)
    lab = get_object_or_404(Lab, module=module)
    flags = lab.red_flags.all()
    submission = LabResult.objects.filter(user=user, lab=lab).first()

    if request.method == "POST" and not submission:
        user_choices = [int(x) for x in request.POST.getlist('flags')]
        correct_flags = flags.filter(is_correct=True)
        # Calculate the lab score from the selected flags.
        correct_count = sum(1 for c in correct_flags if c.id in user_choices)
        score = (correct_count / correct_flags.count()) * 100 if correct_flags.exists() else 0
        
        new_result = LabResult.objects.create(user=user, lab=lab, score_percentage=score)
        new_result.selected_flags.set(user_choices)
        return redirect('lab_exercise', module_id=module.id)

    return render(request, 'core/lab_exercise.html', {'lab': lab, 'flags': flags, 'submission': submission, 'module': module})

@login_required
def certificates_view(request):
    return render(request, 'core/certificates.html', {
        'earned_badges': Module.objects.filter(quizresult__user=request.user, quizresult__passed=True).distinct(),
        'certificate': Certificate.objects.filter(user=request.user).first()
    })

@staff_member_required(login_url='dashboard')
def analytics_view(request):
    students = User.objects.all().order_by('date_joined')
    total_students = len(students)

    #  enrollment over Time (vertical Bar Chart)
    month_counts = {}
    for s in students:
        month_name = s.date_joined.strftime('%B %Y') if s.date_joined else "Unknown"
        month_counts[month_name] = month_counts.get(month_name, 0) + 1

    max_enrollment = max(month_counts.values()) if month_counts else 1
    enrollment_data = []
    for k, v in month_counts.items():
        #  percentage height for CSS
        pct = int((v / max_enrollment) * 100)
        enrollment_data.append({'month': k, 'count': v, 'pct': pct})

    # module Completion Rates (Horizontal Bar Chart)
    modules = Module.objects.all().order_by('order')
    completion_data = []
    total_completions = 0

    for m in modules:
        passed_results = QuizResult.objects.filter(module=m, passed=True)
        unique_students_who_passed = []
        for result in passed_results:
            if result.user_id not in unique_students_who_passed:
                unique_students_who_passed.append(result.user_id)
        
        completions = len(unique_students_who_passed)
        total_completions += completions
        
        pct = int((completions / total_students) * 100) if total_students > 0 else 0
        completion_data.append({'code': m.code, 'title': m.title, 'pct': pct})

    # general completion rate
    total_modules_count = len(modules)
    if total_students > 0 and total_modules_count > 0:
        global_completion_rate = int((total_completions / (total_students * total_modules_count)) * 100)
    else:
        global_completion_rate = 0

    # student filter Table
    filter_status = request.GET.get('status', 'all') #def to all if not provideds
    search_query = request.GET.get('q', '').lower()
    students_data = []

    for s in students:
        if search_query:
            # Match the search text with the student's name.
            full_searchable_name = f"{s.first_name} {s.last_name} {s.username}".lower()
            if search_query not in full_searchable_name:
                continue
            
        status = 'Certified' if Certificate.objects.filter(user=s).exists() else 'Active'
        if (filter_status == 'certified' and status != 'Certified') or (filter_status == 'active' and status != 'Active'):
            continue

        results = QuizResult.objects.filter(user=s)
        total_score = sum(r.score_percentage for r in results)
        avg_score = (total_score / len(results)) if len(results) > 0 else 0.0

        students_data.append({
            'student': s,
            'completed_count': results.filter(passed=True).count(),
            'avg_score': round(avg_score, 1),
            'status': status
        })

    students_list = students_data[:5] if not search_query and filter_status == 'all' else students_data
    
    all_results = QuizResult.objects.all()
    global_score_sum = sum(r.score_percentage for r in all_results)
    global_quiz_avg = (global_score_sum / len(all_results)) if len(all_results) > 0 else 0.0

    return render(request, 'core/analytics.html', {
        'total_enrollments': total_students,
        'global_completion_rate': global_completion_rate,
        'global_quiz_avg': round(global_quiz_avg, 1),
        'certified_students_count': Certificate.objects.count(),
        'students_data': students_list,
        'enrollment_data': enrollment_data,
        'completion_data': completion_data,
        'filter_status': filter_status,
        'search_query': search_query,
    })