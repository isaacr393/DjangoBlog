from django.contrib import admin
from blog import models

# Register your models here.
admin.site.register(models.Perfil)
admin.site.register(models.Usuario)
admin.site.register(models.Post)
admin.site.register(models.Comentarios)
