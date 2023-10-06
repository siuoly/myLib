# from django.shortcuts import render
from django.http import HttpResponse


def index(request):
    # print(request)
    # print(HttpResponse("Hello, Myname is louis."))
    return HttpResponse("Hello, Myname is louis.")

# Create your views here.
