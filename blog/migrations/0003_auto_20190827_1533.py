# Generated by Django 2.2.3 on 2019-08-27 15:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20190816_1528'),
    ]

    operations = [
        migrations.RenameField(
            model_name='comentarios',
            old_name='siguienteComentario',
            new_name='comentarioPadre',
        ),
    ]
