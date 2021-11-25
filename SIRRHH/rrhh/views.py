from typing import ContextManager
import django
from django.forms.forms import Form
from django.http.request import HttpRequest
from django.http.response import Http404, HttpResponse
from django.shortcuts import render,  redirect
from django.contrib.auth import  authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib import messages

from .models import *
import datetime

# Create your views here.
@login_required
def index(request):
    userr = request.user
    if userr.has_perm('rrhh.movimientoPersonal'):
        return render(request, "indexrrhh.html")
    return render(request, "indexrrhh.html")

# def login(request):
#     return render(request, 'login.html')
def perfil(request):
    if User.is_authenticated:
        messages.success(request, 'Necesitas iniciar sesion para tener acceso.')
        return render(request, "vacantes.html")
    else:
        return render(request, "perfil.html")

def vacante(request):
    context = {
        'cargos' : Cargo.objects.all(),
        'TipoVacante' : CatTipovacante.objects.all(),
        'TipoPubli' : CatPublicidad.objects.all(),
        'Vacantes' : Vacante.objects.all()
    }
    
    return render(request, "vacantes.html", context)

def movimientopersonal(request):
    return render(request, "movimientopersonal.html")

def nomina(request):
    return render(request, "nomina.html")

def seleccion(request):
    return render(request, "seleccion.html")

def reclutamiento(request):
    context = {
        'cargos' : Cargo.objects.all(),
        'TipoVacante' : CatTipovacante.objects.all(),
        'TipoPubli' : CatPublicidad.objects.all(),
        'Vacantes' : Vacante.objects.all()
    }
    
    if request.method == 'POST':
        codVacanate_form = request.POST['codVacante']
        cargo_form = request.POST['cargo']
        cargo = Cargo.objects.get(codcargo=cargo_form)
        vacante_form = int(request.POST['vacante'])
        vacante = CatTipovacante.objects.get(idtipovacante=vacante_form)
        publi_form = int(request.POST['publi'])
        publi = CatPublicidad.objects.get(idpublicidad=publi_form)
        fechaContratacion_form = request.POST['fechaContratacion']
        fechalimite_form = request.POST['fechalimite']
        presupuestoPubli_form = request.POST['presupuestoPubli']
        descripcion_form = request.POST['descripcion']
        estado = False
        
        datosVacante = Vacante( codvacante=codVacanate_form, descripcion=descripcion_form, 
                               presupuestopublicidad=presupuestoPubli_form, fechalimiterecepcion=fechalimite_form, 
                               fechacontratacion=fechaContratacion_form, fechaelaboracion=datetime.datetime.now(), 
                               elaboradapor=request.user.username, autorizadapor=request.user.username, estado=estado,
                               idtipovacante=vacante, codcargo=cargo, idpublicidad=publi)
        datosVacante.save()
        messages.success(request, 'Vacante guardada')
        return render(request, 'reclutamiento.html', context)
    
    
    return render(request, 'reclutamiento.html', context)

def loginpost(request):
    if request.method == 'POST':
        context = {
            'usuario' : Usuariopostulante.objects.all()
        }
        
        user = request.POST['user']
        hashs = request.POST['pass']
        print('--------------------------')
        print(user)
        print(hashs)
        
        if user != None and hashs != None:
            return render(request, "perfil.html")
        
        return render(request, "vacantes.html", context)
    return render(request, "vacantes.html")