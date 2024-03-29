# Generated by Django 2.2.3 on 2019-07-19 15:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Perfil',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('perfil', models.CharField(choices=[('USER', 'usuario'), ('ADMIN', 'administrador')], max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=50)),
                ('perfil', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Perfil')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('tags', models.CharField(max_length=100)),
                ('contenido', models.TextField()),
                ('fechaEmision', models.DateField()),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Usuario')),
                ('perfilVer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Perfil')),
            ],
        ),
        migrations.CreateModel(
            name='Comentarios',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contenido', models.TextField()),
                ('fechaEmision', models.DateField()),
                ('me_gusta', models.PositiveIntegerField()),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Usuario')),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Post')),
                ('siguienteComentario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Comentarios')),
            ],
        ),
    ]
