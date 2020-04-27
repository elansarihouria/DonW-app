from django.urls import path
from . import views

urlpatterns = [
	#ex: /donwapp/ 
	path('', views.index, name='index'),
	#ex: /donwapp/'zakaria@gmail.com'/'zakaria'/'155'
	#path('<CharField:mail>', views.signUp, name='signUp'),
	#path('<int:id>/example/', views.example,name='example'),
	path('signUp/',views.signUp),
	path('signIn/',views.signIn),
	#path('timeline/',views.timeline),
	path('hotspot/',views.getHotspot),
	path('test/',views.test),
	path('location/',views.location),

]