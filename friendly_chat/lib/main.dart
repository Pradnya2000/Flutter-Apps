import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendly_chat/ContactPage.dart';

void main() {
  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'list demo',
      home:ContactPage(),
    );
  }
}