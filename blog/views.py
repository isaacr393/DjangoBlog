from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from blog.models import Usuario, Post, Comentarios
from django.urls import reverse
import datetime
import json
from django.http import JsonResponse
# Create your views here.



def home(request, usuario_id):
    user = Usuario.objects.get(id = usuario_id)
    post = Post.objects.all();
    return render(request,'home.html', { 'usuario': user, 'posts': post } )

def login(request):
    return render(request, 'login.html')

def validaLogin(request):
    
    usuario = request.POST['usuario']
    contraseña = request.POST['contrasena']
    user = Usuario.objects.filter(user = usuario, password = contraseña)
    if user:
        return HttpResponseRedirect( reverse('blog:home', args=( user[0].id, ) ) )

    else:
        return render( request,'login.html', { 'error_message': 'Los datos son incorrectos' }  )


def postRedirect(request, usuario_id):
    usuario = Usuario.objects.get(id = usuario_id)
    return render(request, 'post.html', {'usuario': usuario} )

def registrarPost(request, usuario_id):
    usuario = Usuario.objects.get(id = usuario_id)
    time = datetime.datetime.now()
    year = time.strftime('%Y')
    month = time.strftime('%m')
    day = time.strftime('%d')
    timeRegister = '{}-{}-{}'.format(year, month, day)
    
    post = Post()
    post.fechaEmision = timeRegister
    post.contenido = request.POST['contenido']
    post.tags = request.POST['tags']
    perfil = post.rtObjPerfil( request.POST['perfilVer'] )
    post.perfilVer = perfil
    post.title = request.POST['title']
    post.author = usuario
    
    try:
        post.save()
        return HttpResponseRedirect(reverse('blog:home', args=(usuario_id,)))
    except:
        HttpResponse('Ha habido un error')

def visualizarPost(request, usuario_id, post_id):#view para ver los posts
    usuario = Usuario.objects.get(id = usuario_id)
    post = Post.objects.get(id = post_id)
    comentarios = post.comentarios_set.all().order_by('id')

    return render(request, 'rdPost.html', { 'usuario': usuario, 'post': post, 'comentarios': comentarios} )


def recibirComentario(request):
    usuario = Usuario.objects.get(id=int(request.POST['user']) )
    post = Post.objects.get(id=int(request.POST['post']) )
    comentario = Comentarios()

    time = datetime.datetime.now()
    year = time.strftime('%Y')
    month = time.strftime('%m')
    day = time.strftime('%d')
    timeRegister = '{}-{}-{}'.format(year, month, day)

    comentario.contenido = request.POST['comentario']
    comentario.author = usuario
    comentario.post = post
    comentario.fechaEmision = timeRegister
    comentario.me_gusta = 0
    comentario.orden = 0

    comentario.save()
    comentarioId = comentario.id

    respuesta = { 'contenido': request.POST['comentario'], 'comentarioId': comentarioId }
    return JsonResponse( respuesta, safe=False )
   

def recibirSubComentario(request):
    usuario = Usuario.objects.get(id=int(request.POST['user']) )
    post = Post.objects.get(id=int(request.POST['post']) )
    comentarioAnterior = Comentarios.objects.get( id=int( request.POST['id'] ) )
    comentario = Comentarios()

    time = datetime.datetime.now()
    year = time.strftime('%Y')
    month = time.strftime('%m')
    day = time.strftime('%d')
    timeRegister = '{}-{}-{}'.format(year, month, day)

    comentario.contenido = request.POST['comentario']
    comentario.author = usuario
    comentario.post = post
    comentario.fechaEmision = timeRegister
    comentario.me_gusta = 0
    comentario.comentarioPadre = comentarioAnterior
    comentario.orden = int( request.POST['orden']) + 1;
    comentario.save()
    comentarioId = comentario.id


    respuesta = { 'contenido': request.POST['comentario'], 'comentarioId': comentarioId }
    return JsonResponse( respuesta, safe=False )


def devolverOrden(request):
    comentario = Comentarios.objects.get( id=int( request.POST['id'] ) )
    respuesta = {'orden': comentario.orden}
    return JsonResponse( respuesta, safe=False )

    

