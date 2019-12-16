from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Perfil(models.Model):
    profiles = [
        ('USER','usuario'),
        ('ADMIN','administrador')
    ]
    perfil = models.CharField(max_length=10, choices = profiles)
    
    def __str__(self):
        return self.perfil

class Usuario(models.Model):
    user = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    perfil = models.ForeignKey('Perfil', on_delete=models.CASCADE)
    
    def __str__(self):
        return self.user
    
    def getPerfil(self):
        if self.perfil.__str__() == 'ADMIN':
            return True
        else:
            return False


class Post(models.Model):
    title = models.CharField(max_length=50)
    author = models.ForeignKey('Usuario',on_delete=models.CASCADE)
    perfilVer = models.ForeignKey('Perfil', on_delete=models.CASCADE)
    tags = models.CharField(max_length=100)
    contenido = models.TextField()
    fechaEmision = models.DateField()

    def __str__(self):
        return self.title

    def getContext(self):
        return self.contenido[0:200]

    def getPerfil(self):
        if self.perfilVer.__str__() == 'ADMIN':
            return True
        else:
            return False

    def rtObjPerfil(self, buscarPerfil):
        if buscarPerfil == 'ADMIN':
            return Perfil.objects.get(id=1)
        elif buscarPerfil == 'USER':
            return Perfil.objects.get(id=2)




class Comentarios(models.Model):
    author = models.ForeignKey('Usuario',on_delete=models.CASCADE)
    post = models.ForeignKey('Post',on_delete=models.CASCADE)
    contenido = models.TextField()
    fechaEmision = models.DateField()
    comentarioPadre = models.ForeignKey('Comentarios',on_delete=models.CASCADE, null=True)
    orden = models.PositiveIntegerField(null=True)
    me_gusta = models.PositiveIntegerField()


