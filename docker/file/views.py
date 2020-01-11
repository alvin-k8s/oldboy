from django.shortcuts import render
from django.http import HttpResponse

import socket

# Create your views here.
def index(request):
    
    hostname = socket.gethostname()
    
    return HttpResponse(hostname)


