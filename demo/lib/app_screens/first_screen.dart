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
        )
      ]),
    ));
  }
}
