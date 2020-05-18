import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    title: "StateFul App",
    home:favCity()
  )
);
}
class favCity extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _favCityState();
  }
}

class _favCityState extends State<favCity>
{
  String nameOfCity="";
  var _currencies=['rupees','doller','pound','other'];
  var _currentvalueselected='rupees';
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
     appBar:AppBar(
       title:Text("Stateful widget")
     ),
     body:Container(
       margin: EdgeInsets.all(10.0),
       padding: EdgeInsets.all(10.0),
       child:Column(children: <Widget>[
          TextField(
            onSubmitted:(String userInput){
              setState(() {
                 nameOfCity=userInput;
              });
               
            }
          ),
          DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem)
              {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child:Text(dropDownStringItem)
                  );
              }).toList(),
              onChanged: (String newValueSelected)
              {
                setState(() {
                  _currentvalueselected=newValueSelected;
                });
              },
              value: _currentvalueselected,
          ),
          Padding(padding: EdgeInsets.all(10.0),
          child: Text("Your Favourite city is $nameOfCity")
          )
         

       ],)
     )
    

   );
  }

}