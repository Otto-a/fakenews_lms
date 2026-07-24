# core/forms.py
import re #the text matches a pattern.
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class RegisterForm(UserCreationForm): #ext Built in
    first_name = forms.CharField(max_length=150, required=True ,min_length=2)
    last_name = forms.CharField(max_length=150, required=True,min_length=2)
    email = forms.EmailField(required=True)

    class Meta(UserCreationForm.Meta): # confg for form keep existing add new fields
        fields = UserCreationForm.Meta.fields + ('first_name', 'last_name', 'email')

    def clean_email(self): #custom val
        email = self.cleaned_data.get('email') #get mail from form after initial val
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("This email address is already in use.")
        return email #val passes
    
    def clean_first_name(self):
        first_name = self.cleaned_data.get('first_name')
        if not re.match(r'^[a-zA-Z\s\-]+$', first_name):
            raise forms.ValidationError("First name can only contain letters, spaces, or hyphens.")
        return first_name

    # Ensure only letters are used
    def clean_last_name(self):
        last_name = self.cleaned_data.get('last_name')
        if not re.match(r'^[a-zA-Z\s\-]+$', last_name):
            raise forms.ValidationError("Last name can only contain letters, spaces, or hyphens.")
        return last_name