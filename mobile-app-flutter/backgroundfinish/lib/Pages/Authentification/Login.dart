import 'dart:convert';
import 'dart:math';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mansouri/Pages/MainPage/MsgTheBoot/msg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;


  final formKey = GlobalKey<FormState>();
  String email;
  String password;


  Future<bool> submitInfo(String mail, String password) async {
    print("d6alnaa");
    String urlJson = "http://192.168.1.9:8000/managment/loginClient/?mail=$mail&password=$password";
    var res = await http.get(Uri.encodeFull(urlJson));
    var resBody = json.decode(res.body);
    return resBody["response"];
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height / 5,),
              Center(
                child: Text("Login",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 50,
                      fontFamily: 'BalooBhai'
                  ),),
              ),
              SizedBox(height: height / 20,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (input) {
                          email = input;
                        },
                        validator: (input) {
                          if (EmailValidator.validate(input)) {} else {
                            return "make sure the email is correct ";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.contacts,
                                color: Colors.deepPurple)
                        ),
                      ), SizedBox(height: height / 30,),
                      TextFormField(
                        onSaved: (input) {
                          password = input;
                        },
                        validator: (input) {
                          if (input.length > 8) {} else {
                            return "there is a problem in the password ";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),

                            labelText: "Password",
                            prefixIcon: Icon(Icons.keyboard_hide,
                                color: Colors.deepPurple)
                        ),
                        obscureText: true,
                      ), SizedBox(height: height / 30,),
                      Center(
                        child: ProgressButton(

                            borderRadius: 20,
                            color: Colors.deepPurple,
                            defaultWidget: const Text('Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                            //  progressWidget: const CircularProgressIndicator(),
                            progressWidget: SpinKitRotatingCircle(
                              color: Colors.red,
                              size: 50.0,
                            ),
                            width: width / 3.5,
                            height: height / 22,
                            onPressed: submit
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<Location> getPermission() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }
    } on PlatformException catch (e) {
      print("chdina l exception");
    }

    return location;
  }

  void _getLocation() async {
    var location = new Location();
    try {
      await location.getLocation().then((onValue) {
        print(onValue.latitude.toString() + "," + onValue.longitude.toString());
      });
    } catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        print("chi la3ba ");
      }
    }
  }


  static void getLocation() async {
    print("hi hi");
  }


  Future<void> submit() async {
    //  await AndroidAlarmManager.initialize();
    // await AndroidAlarmManager.periodic(const Duration(seconds: 7), 0,getLocation );
    // await _getLocation();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print("password : " + this.password);
      print("email : " + this.email);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => msg(state: false,)),
      );
    }
  }
}