

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Pages/advices/constant.dart';

class StateOfTheClient extends StatelessWidget {
  bool state ;
  var height ;
  var width ;
  StateOfTheClient({this.state,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    List<Widget> temp = [
      SizedBox(height: this.height/10)
    ];
    Text msg;
    Icon icon;
    if(this.state){
      msg = Text("you are safe ",
          style: TextStyle(
              color: Colors.green,
              fontSize: 40,
              fontFamily: 'BalooBhai'
          ));
      temp.add(msg);
      icon = Icon(Icons.done_all,color: Colors.greenAccent,size: 100,);
      temp.add(icon);
    }else{

      icon = Icon(Icons.notifications_active,color: Colors.redAccent,size: 100,);
      temp.add(icon);
      msg = Text("we have bade news",
      style:danger);
      temp.add(msg);
      /*  String contenue = "Our system detected that you went to a place where there is a person infected by The pandemic. for that ,you should self-isolate. Seek medical attention if you have a fever, a cough, and difficulty breathing";
      Post p = new Post(content: contenue);
      temp.add(SizedBox(height: 40,));
      temp.add(alertMsg(height: height,width: width,post: p)); */
    }
    temp.add(SizedBox(height: this.height/50));
    return Column(
        children:temp);
  }
}