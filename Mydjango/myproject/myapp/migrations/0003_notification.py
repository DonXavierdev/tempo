# Generated by Django 4.1.6 on 2024-03-09 12:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_student'),
    ]

    operations = [
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('stud_id', models.BigIntegerField()),
                ('message', models.TextField(max_length=100)),
            ],
        ),
    ]
