import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mansouri/Pages/advices/info_screen.dart';
import '../StateOfTheClient.dart';
import '../../advices/constant.dart';
import '../../advices/widgets/my_header.dart';


class msg extends StatefulWidget {
  bool state ;
  msg({this.state});
  @override
  _msgState createState() => _msgState();
}

class _msgState extends State<msg> {
  bool state ;
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => InfoScreen()
    )
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var duration = new Duration(seconds:10);
    new Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.width ;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[MyHeader(
          image: "assets/icons/Drcorona.svg",
          textTop: "All you need",
          textBottom: "is stay at home.",
          offset: 0,
        ),
          StateOfTheClient(state: widget.state,height: height,width: width),
        ],
      ))
      ,
    );
  }
}
