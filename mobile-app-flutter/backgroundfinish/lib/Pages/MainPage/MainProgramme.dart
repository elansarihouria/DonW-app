import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import '../../Pages/PersonalInfo/PersonalInformations.dart';
import '../../Pages/MainPage/StateOfTheClient.dart';
import '../../Pages/Setting/UpdateInfo.dart';

class MainProgramme extends StatelessWidget {
  bool clientState = true;
  Color appColor ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if(clientState){
      appColor = Colors.green;
    }else{
      appColor = Colors.red;
    }

    appColor = Colors.deepPurple;
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      StateOfTheClient(state: clientState,height: height,width: width),
                    ],
                  ),
                ),
              )),
              Container(child: PersonalInformations(email: "anas.mansouri@usmba.ac.ma",location: "fes",numero: "0675122077",color:appColor ,)),
              UpdateInfo(appColor: appColor,)
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {

    return Container(
      color: appColor,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(1.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "profile",
            icon: Icon(Icons.perm_identity),
          ),
          Tab(
            text: "setting",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );}}