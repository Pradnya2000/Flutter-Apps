import 'package:flutter/material.dart';

//main fuction is starting point of every flutter app
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            title: Text("I am Rich"),
            backgroundColor: Colors.blueGrey,
          ),
          backgroundColor: Colors.blueGrey[900],
          body: Center(
            child: Image(
              image:AssetImage('images/diamond.png'), 
            ),
          ),
        ),
      ),
    );
