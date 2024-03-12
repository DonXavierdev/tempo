from django.shortcuts import render
from .models import Student
from .models import Notification
from .models import test
from django.core.serializers import serialize
from .models import Teacher
from .models import Users
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login
import json
# def userreg(request):
#     return render(request,"userreg.html",{})
# def insertuser(request):
#     uname = request.POST['name']
#     uemail = request.POST['email']
#     unumber = request.POST['number']
#     us = User(name = uname , email = uemail , number = unumber)
#     us.save()
#     return render(request,'index.html',{'user':us})

def stud_data(request):
    students = Student.objects.all()
    stud_name = students[1].name
    stud_prn = students[1].prn
    stud_department = students[1].department
    notify = Notification.objects.all()
    stud_notify = notify[0].message
    return JsonResponse({'name': stud_name , 'prn' : stud_prn , 'department': stud_department, 'notification':stud_notify })

def teach_data(request):
    teachers = Teacher.objects.all()
    teach_name = teachers[0].name
    teach_prn = teachers[0].prn
    teach_department = teachers[0].department
    notify = Notification.objects.all()
    teach_notify = notify[1].message
    return JsonResponse({'name': teach_name , 'prn' : teach_prn, 'department': teach_department, 'notification':teach_notify })
@csrf_exempt 
def save_data(request):
    
    if request.method == 'POST':
        data = request.POST.get('data')
        tst = test(msg = data)
        tst.save()
        return JsonResponse({'message': 'Data saved successfully.'})
    else:
        return JsonResponse({'message': 'Invalid request method.'}, status=400)
@csrf_exempt 
def login_view(request):
    if request.method == 'POST':
        prn = request.POST.get('username')
        password = request.POST.get('password')        
        user = Users.objects.get(prn=prn)
        if user.password == password:
            user_type = user.type  
            if user_type == 'teacher':
                teacher = Teacher.objects.get(prn=user.prn)
                teach_prn = teacher.prn
                teach_name = teacher.name
                teach_dep = teacher.department
                teacher_notifies = Notification.objects.filter(prn=user.prn)
                teach_notify_msgs = [notify.message for notify in teacher_notifies]
                print(teach_notify_msgs)
                return JsonResponse({'name': teach_name , 'prn' : teach_prn , 'department': teach_dep,'user_type': user_type,'notification':teach_notify_msgs})
            elif user_type == 'student':
                student = Student.objects.get(prn=user.prn)
                stud_prn = student.prn
                stud_name = student.name
                stud_dep = student.department
                student_notifies = Notification.objects.filter(prn=user.prn)
                student_notify_msgs = [notify.message for notify in student_notifies]
                return JsonResponse({'name': stud_name , 'prn' : stud_prn , 'department': stud_dep,'user_type': user_type,'notification':student_notify_msgs})
        else:
            return JsonResponse({'error': 'Invalid username or password'}, status=400)
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)


