from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import render, redirect

from .models import Employee


def login_view(request):
    if request.method == "POST":
        user = authenticate(
            request,
            username=request.POST.get("username"),
            password=request.POST.get("password"),
        )
        if user:
            login(request, user)
            return redirect("employees")
    return render(request, "core/login.html")


def register_view(request):
    if request.method == "POST":
        user = User.objects.create_user(
            username=request.POST["username"],
            password=request.POST["password"],
            first_name=request.POST["first_name"],
            last_name=request.POST["last_name"],
        )
        Employee.objects.create(
            user=user,
            position=request.POST["position"],
            department=request.POST["department"],
        )
        return redirect("login")
    return render(request, "core/register.html")


@login_required
def employees_view(request):
    employees = Employee.objects.select_related("user")
    return render(
        request,
        "core/employees.html",
        {"employees": employees},
    )
