

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

List<String> getListElements()
{
  var items=List<String>.generate(1000, (counter) => "Item $counter");
  return items;
} 

Widget getListView()
{
  var listdata=getListElements();
  var listView=ListView.builder(
    itemBuilder: (context ,index)
    {
      return ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title:Text(listdata[index]),
            onTap: ()
            {
              debugPrint("tapped on ${listdata[index]}");
            },
      );
    }
  );
  return listView;

}
