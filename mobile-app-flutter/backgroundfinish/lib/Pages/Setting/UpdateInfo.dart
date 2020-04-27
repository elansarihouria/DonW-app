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

class UpdateInfo extends StatefulWidget {
  Color appColor ;
  UpdateInfo({this.appColor});
  @override
  _UpdateInfoState createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {

  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  String coronaState;
  String phoneNumber;
  int groupeValue =2;

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
                      color: widget.appColor,
                      size: 130.0,
                    ),
                    //IconTheme
                  ),Text("Update your info",style: TextStyle(
                      color: widget.appColor,
                      fontSize: 40,
                      fontFamily: 'BalooBhai'
                  )),
                  SizedBox(height: 60,),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(Icons.email,color: widget.appColor)
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
                        prefixIcon: Icon(Icons.keyboard_hide,color: widget.appColor)
                    ),
                    validator: (password) {
                      if(password.length<8) {
                        return "Please The lenghtof the Password should be greather than 8 characters";
                      }
                    },
                    onSaved: (password){
                      this.password=password;
                    },
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),SizedBox(height: 20)
                  ,SizedBox(height: 20),
                  new TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Enter your phone number",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(Icons.phone,color: widget.appColor)
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
                  ,SizedBox(height: 20,)
                  ,Row(
                  children: <Widget>[
                  SizedBox(width: 5),
                  Text("corona virus state " ,style: new TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                  )),SizedBox(width: 10,),
                  Text("Positive"),
                  new Radio(onChanged: (int e)=>RadioChanged(e),value: 1, groupValue: groupeValue, activeColor: Colors.red),
                  Text("Negative"),
                  new Radio(onChanged: (int e)=>RadioChanged(e),value: 2, groupValue: groupeValue,activeColor: Colors.blue),
                  ],
                   ),
                  Center(
                      child:ProgressButton(
                        borderRadius: 20,
                        color: widget.appColor,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void RadioChanged(int e){
    setState(() {
      groupeValue =e;
    });
  }

  Future<void> submit() async {
    print("brakena 3la subbmit");
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print("email : "+this.email);
      print("password : "+this.password);
      print("corona state : "+this.coronaState);
      print("phone : "+this.phoneNumber);
    }
    try {
      // hna appel l serveur bach nsajelo l user f data base
      print("d5alna lhna ");
      Navigator.pushNamed(context, "Login");
    } catch (e) {
      print(e.message);
    }
  }
}

