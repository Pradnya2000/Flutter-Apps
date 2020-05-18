import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
      //  width: 100.0,
      //  height: 200.0,
      // margin: EdgeInsets.only(left:20.0,right: 15.5),
      //padding: EdgeInsets.all(30.0),
      color: Colors.indigoAccent,
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              "Aptitude",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            )),
            Expanded(
                child: Text(
              "10:00",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 30.0),
            )),
            Expanded(
                child: Text(
              "12:00",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 30.0),
            ))
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              "Flutter",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            )),
            Expanded(
                child: Text(
              "2:00",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 30.0),
            )),
            Expanded(
                child: Text(
              "8:00",
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.none, fontSize: 30.0),
            ))
          ],
        ),
        NatureImageAsset(),
        ReactButton()
      ]),
    ));
  }
}
class NatureImageAsset extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage('images/Joe.jpg');
    Image imagedemo=Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child:imagedemo);
  }
  
}

class ReactButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
     
      child:RaisedButton(
        color: Colors.deepOrange,
        child: Text(
          "click me",
          style: TextStyle(
            color: Colors.black
          ),),
        elevation: 6.0,
        onPressed: (){
          react(context);
        })
    );
  }
  
}

void react(BuildContext context)
{
  var alertDailog=AlertDialog(
    title: Text("Reacted"),
    content: Text("now do it"),

  );
  showDialog(
    context: context,
    builder: (BuildContext context)
    {

        return alertDailog;
    }
    );
}