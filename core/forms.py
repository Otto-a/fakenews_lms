# core/forms.py
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class RegisterForm(UserCreationForm): #ext Built in
    first_name = forms.CharField(max_length=150, required=True)
    last_name = forms.CharField(max_length=150, required=True)
    email = forms.EmailField(required=True)

    class Meta(UserCreationForm.Meta): # confg for form keep existing add new fields
        fields = UserCreationForm.Meta.fields + ('first_name', 'last_name', 'email')

    def clean_email(self): #custom val
        email = self.cleaned_data.get('email') #get mail from form after initial val
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("This email address is already in use.")
        return email #val passes