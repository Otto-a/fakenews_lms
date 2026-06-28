// static/js/main.js

document.addEventListener('DOMContentLoaded', function() {
    const configEl = document.getElementById('analyticsConfig');
    
    if (configEl) {
        // Read data safely from HTML data attributes
        const months = JSON.parse(configEl.getAttribute('data-months') || '[]');
        const counts = JSON.parse(configEl.getAttribute('data-counts') || '[]');
        const labels = JSON.parse(configEl.getAttribute('data-labels') || '[]');
        const completions = JSON.parse(configEl.getAttribute('data-completions') || '[]');
        
        // Initialize Enrollment over Time (Line Chart)
        const enrollmentCtx = document.getElementById('enrollmentChart').getContext('2d');
        new Chart(enrollmentCtx, {
            type: 'line',
            data: {
                labels: months,
                datasets: [{
                    label: 'Monthly New Enrollments',
                    data: counts,
                    borderColor: '#2563eb',
                    backgroundColor: 'rgba(37, 99, 235, 0.08)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { 
                        beginAtZero: true, 
                        ticks: { stepSize: 1 } 
                    }
                }
            }
        });

        // Initialize Module Quiz Completion Rates (Bar Chart)
        const completionCtx = document.getElementById('completionChart').getContext('2d');
        new Chart(completionCtx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Completion Percent (%)',
                    data: completions,
                    backgroundColor: '#10b981',
                    borderRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { 
                        max: 100, 
                        beginAtZero: true 
                    }
                }
            }
        });
    }
});