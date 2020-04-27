import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// avatar


class PersonalInformations extends StatefulWidget {

  Color color ;
  var email;
  var numero;
  var location;

  PersonalInformations({this.email,this.numero,this.location,this.color});
  @override
  _State createState() => _State();
}

class _State extends State<PersonalInformations> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home:  Scaffold(

          body: Container(
              padding: EdgeInsets.fromLTRB(10,10, 10, 10),

              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50,),
                 Icon(Icons.perm_identity,size: 130,color:widget.color,),
                  SizedBox(height: 50),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[FlatButton.icon(
                      icon: Icon(Icons.mail,
                        color: widget.color,
                      ),
                      label: Text(widget.email,
                        style: TextStyle(
                            color: widget.color
                            ,fontSize: 20
                        ),),
                    ),
                    ],
                  ),
                  //fdjlkj
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[FlatButton.icon(
                      icon: Icon(Icons.phone,
                        color: widget.color,
                      ),
                      label: Text(widget.numero,
                        style: TextStyle(
                            color: widget.color
                            ,fontSize: 20
                        ),),
                    ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[FlatButton.icon(
                      icon: Icon(Icons.location_on,
                        color: widget.color,
                      ),
                      label: Text(widget.location,
                        style: TextStyle(
                            color: widget.color
                            ,fontSize: 30
                        ),),
                    ),
                    ],
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.healing,
                      color: widget.color,
                    ),
                    label: Text("negative",
                      style: TextStyle(
                          color: widget.color
                          ,fontSize: 20
                      ),),
                  )

                ],
              )
          )
      ),
      title: 'Tab demo',
    );
  }

}


