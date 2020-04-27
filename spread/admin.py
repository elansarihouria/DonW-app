from django.contrib import admin

from .models import *

from django.contrib.gis.admin import OSMGeoAdmin

# Register your models here.

@admin.register(Location)
class LocationAdmin(OSMGeoAdmin):
    list_display = ('name', 'user_location')


admin.site.register(User)
#admin.site.register(Timeline)
admin.site.register(Test)
#admin.site.register(Hotspot)

@admin.register(Geohotspot)
class LocationAdmin(OSMGeoAdmin):
    display = ('location')