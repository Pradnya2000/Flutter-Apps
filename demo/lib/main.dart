import 'package:demo/app_screens/first_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyFlutter());

  
class MyFlutter extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return    MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"myapp",
      home:Scaffold(
        appBar:AppBar(title:Text('myApp'),),
        body:FirstScreen()
    
  )
);
  }
  
}