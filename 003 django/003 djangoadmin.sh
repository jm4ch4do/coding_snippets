' ------------------------------ BASICS ------------------------------ '
django-admin # shows all commands for django-admin

django-admin startproject site1 # create python project


' ----------------------------- ADMIN APP ---------------------------- '
python manage.py createsuperuser # create superuser for admin

# register table from myapp in web admin (Question is the name of the Table or ORM class)
nano /myapp/admin.py

from .models import Question
admin.site.register(Question)

# You can also replace .register for a more advanced version 
# allowing you to choose the fields to be displayed
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    fields = ['title', 'description']

# You can also choose which fields are editable
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ['title', 'description']
    list_editable = ['description']
    list_filter = ['is_published']
    search_fields = ['title']



