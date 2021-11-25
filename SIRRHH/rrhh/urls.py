from SIRRHH import urls
from django.conf.urls import url
from django.urls import path, include
from . import views
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib import admin

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('reclutamiento/', views.reclutamiento, name='reclutamiento'),
    path('accounts/', include('django.contrib.auth.urls')),
    #path('home/', views.index, name='home'),
    path('accounts/profile/', views.index, name='home'),
    path('perfil/', views.perfil, name='profile'),
    path('vacantes/', views.vacante, name='vacante'),
    path("login/", views.loginpost, name="loginpost"),
    path("movimientopersonal/", views.movimientopersonal, name="movimientopersonal"),
    path("gestionnomina/", views.nomina, name="nomina"),
    path("seleccion/", views.seleccion, name="seleccion"),
    path('jet/', include('jet.urls', 'jet')),
    #path('jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),
    #path('login/', auth_views.LoginView.as_view(), name='login'),
]