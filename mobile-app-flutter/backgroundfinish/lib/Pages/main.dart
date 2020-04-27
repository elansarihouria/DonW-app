
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:mansouri/Pages/Authentification/Login.dart';
import 'package:mansouri/Pages/Authentification/SignUp.dart';
import 'package:mansouri/Pages/MainPage/MainProgramme.dart';
import 'package:mansouri/Pages/MainPage/MsgTheBoot/msg.dart';
import 'package:mansouri/Pages/advices/info_screen.dart';

void main() async {
    runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/SignUp",
          routes: {
            '/MainProgramme' :(context)=> MainProgramme(),
            '/advice':(context) => InfoScreen(),
            '/Login' :(context) => Login(),
            '/SignUp' :(context) => SignUp(),
            '/msg' :(context) =>  msg(),}
));
}
