import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DiceBox(),
      ),
    ),
  );
}

class DiceBox extends StatefulWidget {
  @override
  _DiceBoxState createState() => _DiceBoxState();
}

class _DiceBoxState extends State<DiceBox> {
  int leftDiceNumber=2,rightDiceNumber=3;
  void setNumbers()
  {
      setState(()
      {
        leftDiceNumber=Random().nextInt(6)+1;
        rightDiceNumber=Random().nextInt(6)+1;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: (){
               setNumbers();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
               setNumbers();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      )),
    );
  }

}