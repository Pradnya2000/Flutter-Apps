import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return  Material(
        child: Center(     //center the child
            child:Text(
              generateLuckyNumber(),
            textDirection:TextDirection.ltr,
            style: TextStyle(color: Colors.brown,fontSize: 40.0),
        )
      ) ,
      color: Colors.blueAccent
    );
  }
  
}
String generateLuckyNumber()
{
  var random=Random();
  int luckyNumber=random.nextInt(10);
  return 'Your luckyNumber is $luckyNumber';
}