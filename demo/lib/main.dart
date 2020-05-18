
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_screens/first_screen.dart';

void main()
{
  runApp(MaterialApp(
    title: "Exploring UI",
    home:Scaffold(
      appBar: AppBar(
        title:Text("List Items")
      ),
    body: getListView(),
    )
   
  )
);
}

Widget getListView()
{
  var listview=ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.access_alarm),
        title: Text("Alarm"),
        subtitle: Text("set an alarm"),
        trailing: Icon(Icons.add_alert),
        onTap: (){
          debugPrint("set alarm");
        },
      ),
       ListTile(
        leading: Icon(Icons.audiotrack),
        title: Text("Music"),
        subtitle: Text("Listen songs"),
        trailing: Icon(Icons.library_music),
      ),
       ListTile(
        leading: Icon(Icons.camera_alt),
        title: Text("Camera"),
        subtitle: Text("Click Pictures"),
        trailing: Icon(Icons.camera),
      ),
    ],
  );
  return listview;
}