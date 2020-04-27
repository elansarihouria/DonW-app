#from django.db import models

# Create your models here.
from django.contrib.gis.db import models

from django.contrib.gis.geos import fromstr ,Point
from django.contrib.gis.db.models.functions import Distance
class User(models.Model):
	mail = models.EmailField(primary_key=True, max_length=254)
	#username=models.CharField(max_length=200)
	password = models.CharField(max_length=32)
	username = models.CharField(max_length=40)
	#phone = models.IntegerField()
	def __str__(self):
		return self.mail

class Location(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    user_location = models.PointField()
    time = models.DateTimeField()
    #address = models.CharField(max_length=100)
    #city = models.CharField(max_length=50)
    def __str__(self):
        return self.user.mail


# class Timeline(models.Model):
# 	user = models.ForeignKey(User,on_delete=models.CASCADE)
# 	#user = models.OneToOneField(User, primary_key=True,on_delete=models.CASCADE)
# 	location = models.CharField(max_length=50000)
# 	time = models.DateTimeField()
# 	def __str__(self):
# 		return self.user.mail
class Test(models.Model):
	#user = models.ForeignKey(User, on_delete=models.CASCADE)
	user = models.OneToOneField(User,on_delete=models.CASCADE, primary_key=True)
	coronatest = models.BooleanField()
	# def getLocations(self):
	# 	my_location=[]
	# 	location_list=Timeline.objects.filter(user=self.user)
	# 	for loc in location_list:
	# 		place=loc.location
	# 		time=loc.time
	# 		val={}
	# 		val["place"]=place
	# 		val["time"]=time
	# 		my_location.append(val)
	# 	return my_location
	def getGeoLocations(self):
		#my_location=[]
		location_list=Location.objects.filter(user=self.user)
		return location_list


	def __str__(self):
		return self.user.mail

# class Hotspot(models.Model):
# 	location=models.CharField(max_length=50000)



class Geohotspot(models.Model):
    #user = models.ForeignKey(User,on_delete=models.CASCADE)
    #name = models.CharField(max_length=100)
    location = models.PointField()
    #address = models.CharField(max_length=100)
    #city = models.CharField(max_length=50)

# def comparison(patient,personne):
# 	prob_mail=0
# 	patient_loc=patient.getLocations()
# 	personne_loc=personne.getLocations()
# 	for pat in patient_loc:
# 		for per in personne_loc:
# 			if pat==per:
# 				prob_mail=personne.user.mail
# 				break

# 	return prob_mail



# def coronaProba(patient):
# 	patient_test=patient.test
# 	#patient_loc=patient_test.getLocations()

# 	user_mail=[]
# 	alluser = Test.objects.all()
# 	for user in alluser :
# 		#user_test=user.test
# 		mail=comparison(patient_test,user)
# 		if mail != 0 and mail!=patient.mail:
# 			user_mail.append(mail)
# 		#user_loc=user_test.getLoactions()
# 	return user_mail

#----------------------------------------------------------------------#

def geoComparison(point):
	
	queryset=Location.objects.annotate(distance=Distance('user_location',point)).order_by('distance')[0:6]
	return queryset
	
def coronaGeoProba(patient):
	#patient_test=patient.test
	user_mail=[]
	user_loc=[]
	locations=Location.objects.filter(user=patient)
	for deplace in locations:
		point=deplace.user_location
		per_loc=geoComparison(point)
		for per in per_loc:
			if per.time==deplace.time:
				if per.user!=patient:
					user_loc.append(per)

	for loc in user_loc:
		mail =loc.user.mail
		user_mail.append(mail)

	return user_mail



