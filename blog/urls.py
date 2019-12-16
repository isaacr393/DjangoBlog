from django.urls import path, include
from blog import views


app_name = 'blog'

urlpatterns = [
    path('<int:usuario_id>/', views.home, name="home"),
    path('login/', views.login, name='login'),
    path('validar/', views.validaLogin, name='validarLogin'), 
    path('<int:usuario_id>/post/', views.postRedirect, name="postRedirect"),#Link para realizar los post
    path('registrarPost/<int:usuario_id>/', views.registrarPost, name='registrarPost'), #Link para validar el post
    path('visualizar/<int:usuario_id>/<int:post_id>/', views.visualizarPost, name='visualizarPost'), #link para visualizar los posts
    path('recibirComentario/', views.recibirComentario, name='recibirComentario'),
    path('recibirSubComentario/', views.recibirSubComentario, name='recibirSubComentario'),
    path('devolverOrden/', views.devolverOrden, name='devolverOrden'),
]
