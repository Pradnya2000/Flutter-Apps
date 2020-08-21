import 'package:fashion_app/main.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Expanded(
                          child: ListTile(
                title: Text('Total'),
                subtitle: Text('Rs 340'),
              ),
            ),
            Expanded(
                          child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Check Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//SHA1: 01:31:0A:A5:E0:5F:30:D0:3A:68:F8:91:FF:1B:0A:4A:D4:CB:40:DD