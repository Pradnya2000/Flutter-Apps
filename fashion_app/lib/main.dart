import 'package:fashion_app/categorylist.dart';
import 'package:fashion_app/pages/cart.dart';
import 'package:fashion_app/productlist.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget carousel_widget=Carousel(
      autoplay: false,
      dotBgColor: Colors.transparent,
      images: [
        AssetImage('images/img1.jpg'),
        AssetImage('images/img2.jpg'),
        AssetImage('images/img3.jpg'),
        AssetImage('images/img4.jpg'),
        AssetImage('images/img5.jpg'),
        NetworkImage('https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
        NetworkImage('https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
        NetworkImage('https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
        NetworkImage('https://images.pexels.com/photos/845434/pexels-photo-845434.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
        NetworkImage('https://images.pexels.com/photos/837140/pexels-photo-837140.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Store'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(_) {
                return Cart();
            }));
          }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('pradnya nikumbh'),
              accountEmail: Text('pradnyanikumbh15@gmail.com'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person),backgroundColor: Colors.cyan,),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('My Account'),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (_){
                  return Cart();
                }));

              },
              child: ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('My Orders'),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favourites'),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('About'),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
           Container(
          height: 200,
          child: carousel_widget,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Categories'),
        ),
        CategoryList(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Recent Products'),
        ),
        ProductList(),
        ],
            
      ),
    );
  }
}
