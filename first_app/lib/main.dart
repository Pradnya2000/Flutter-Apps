import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/flutter/website/master/examples/layout/lakes/step5/images/lake.jpg'),
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Widget titleSection = Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
       FavouriteWidget(),
      ],
    ));

Widget buildButtonItem(Color color, IconData icondata, String data) {
  return Container(
    child: Column(
      children: <Widget>[
        Icon(
          icondata,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            data,
            style: TextStyle(
              color: color,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      buildButtonItem(Colors.blue, Icons.call, 'CALL'),
      buildButtonItem(Colors.blue, Icons.send, 'ROUTE'),
      buildButtonItem(Colors.blue, Icons.share, 'SHARE'),
    ],
  ),
);

Widget textSection = Container(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

class FavouriteWidget extends StatefulWidget {
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavourite=true;
  int _favouriteCount=41;
  void _toggleFavourite()
  {
    setState(() {
      if(_isFavourite)
      {
        _isFavourite=!_isFavourite;
        _favouriteCount-=1;
      }
      else
      {
        _isFavourite=!_isFavourite;
        _favouriteCount+=1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(icon: _isFavourite?Icon(Icons.star):Icon(Icons.star_border),
          color: Colors.red,
          onPressed: _toggleFavourite)
          ,),

          Text('$_favouriteCount'),
      
      ],
    );
  }

}