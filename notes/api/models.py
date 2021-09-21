from django.db import models

# Create your models here.


class Note (models.Model):
    body = models.TextField()
    title = models.TextField()
    id1 = models.IntegerField()
    userId = models.TextField()

    def __str__(self) -> str:
        return self.body[0:50]

    class Meta:
        ordering = ['-id1']
