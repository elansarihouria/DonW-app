import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

// to test if it is an email
import 'package:email_validator/email_validator.dart';

//test json

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mansouri/Pages/MainPage/MsgTheBoot/msg.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  String userName;
  String phoneNumber;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView( // hadi 7lina biha l mouchkil dyal l clavier kayghati l boutounate
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Center(
                   child :  Icon(
                        Icons.perm_identity,
                        color: Colors.deepPurple,
                        size: 130.0,
                      ),
                    //IconTheme
                  ),
                  SizedBox(height: 60,),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                        prefixIcon: Icon(Icons.email,color: Colors.deepPurple)
                    ),
                    validator: (email) {
                      if(!EmailValidator.validate(email)) {
                        return "Please Enter an Email";
                      }

                    },
                    onSaved: (email){
                      this.email=email;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(height: 20),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Password",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                        prefixIcon: Icon(Icons.keyboard_hide,color: Colors.deepPurple)
                    ),
                    validator: (password) {
                      if(password.length<8) {
                        return "Please The lenghtof the Password should be greather than 8 characters";
                      }
                    },
                    onSaved: (password){
                      this.password=password;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(height: 20),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter User Name",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(Icons.contacts,color: Colors.deepPurple)
                    ),
                    validator: (username) {
                      // ana mal9it ta condition nderha
                    },
                    onSaved: (username){
                      this.userName=username;
                    },
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(height: 20),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter your phone number",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(Icons.phone,color: Colors.deepPurple)
                    ),
                    validator: (phone ) {
                      // ana mal9it ta condition nderha
                    },
                    onSaved: (phone){
                      this.phoneNumber=phone;
                    },
                    keyboardType: TextInputType.phone,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  )
                  ,SizedBox(height: 30,),Center(
                    child:ProgressButton(
                      borderRadius: 20,
                      color: Colors.deepPurple,
                      defaultWidget: const Text('Submit',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
//  progressWidget: const CircularProgressIndicator(),
                      progressWidget:SpinKitRotatingCircle   (
                        color: Colors.red,
                        size: 50.0,
                      ) ,
                      width: 120,
                      height: 50,
                      onPressed: () async {
                        submit();
                        int score = await Future.delayed(
                            const Duration(milliseconds: 3000), () => 42);
// After [onPressed], it will trigger animation running backwards, from end to beginning
                        return () {
// Optional returns is returning a function that can be called
// after the animation is stopped at the beginning.
// A best practice would be to do time-consuming task in [onPressed],
// and do page navigation in the returned function.
// So that user won't missed out the reverse animation.
                        };
                      },
                    )


                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future<bool> submitInfo({String mail,String password,String userName,String phoneNumber}) async {
    print("d6alnaa");
    String urlJson = "http://192.168.1.9:8000/managment/SignUp/?mail=$mail&password=$password&username=$userName&phone=$phoneNumber";
    var res = await http.get(Uri.encodeFull(urlJson));
    var resBody = json.decode(res.body);
    return resBody["response"];
  }

  Future<void> submit() async {
    print("brakena 3la subbmit");
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print("email : "+this.email);
      print("password : "+this.password);
      print("user name : "+this.userName);
      print("phone : "+this.phoneNumber);
    }
      try {
       /* submitInfo(mail: this.email,password: this.password,phoneNumber: this.password,userName: this.userName).then((onValue){
          print(onValue.toString());); */
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => msg(state: false,)),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }

