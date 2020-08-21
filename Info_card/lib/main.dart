 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:AssetImage('images/profile.jpeg'), 
                ),
              ),  
             ),
             Container(child: Center(
                child: Text(
                  'Pradnya Nikumbh',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily:'Pacifico'
                  ),

                ),
              ),  
             ),
             Container(
               child:Text(
                 'FLUTTER DEVELOPER',
                 style: TextStyle(
                   fontSize: 15,
                   letterSpacing: 2,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ), 
               ) ,
             ),
             SizedBox(height: 20,
             width: 100,
             child: Divider(
               color:Colors.blueGrey[900],
             ),),
             Card(
               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
               color: Colors.white,
               child: ListTile(
                 leading: Icon(Icons.call,color: Colors.blueGrey),
                 title: Text('1238784671'),
                 
               ),
             ),
              Card(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              color: Colors.white,
               child: ListTile(
                 leading: Icon(Icons.email,color: Colors.blueGrey,),
                 title: Text('pradnyanikumbh15@gmail.com'),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
