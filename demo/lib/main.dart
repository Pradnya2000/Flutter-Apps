

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("floatingButton Pressed");
        },
        child: Icon(Icons.add),
        tooltip: "Add item",  
      ),
  
    )
  )
);
}

List<String> getListElements()
{
  var items=List<String>.generate(1000, (counter) => "Item $counter");
  return items;
} 

void showSnackbar(BuildContext context,String msg)
{
  var snackbar=SnackBar(
    content: Text("You tapped on $msg"),
    action:SnackBarAction(
      label: "UNDO",
      onPressed:()
      {
        debugPrint("performing Dummy Undo");
      })
  );
  Scaffold.of(context).showSnackBar(snackbar);
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
              showSnackbar(context,listdata[index]);
            },
      );
    }
  );
  return listView;

}
