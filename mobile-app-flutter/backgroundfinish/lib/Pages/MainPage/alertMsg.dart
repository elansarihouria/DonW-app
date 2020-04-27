import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Pages/dartClasses/Post.dart';


class alertMsg extends StatefulWidget {

  var height;
  var width;
  Post post;
  alertMsg({this.width,this.height,this.post});
  @override
  _alertMsgState createState() => _alertMsgState();
}

class _alertMsgState extends State<alertMsg> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(widget.post.content
                , style: TextStyle(color: Colors.white,
                    fontSize: 23.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
