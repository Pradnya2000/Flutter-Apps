import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(image_location:'images/cats/dress.png',image_caption:'Dress'),
          Category(image_location:'images/cats/tshirt.png',image_caption:'T-Shirt'),
          Category(image_location:'images/cats/formal.png',image_caption:'Formal'),
          Category(image_location:'images/cats/informal.png',image_caption:'InFormal'),
          Category(image_location:'images/cats/shoe.png',image_caption:'Shoes'),   
          Category(image_location:'images/cats/accessories.png',image_caption:'Accessories'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location,this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          height: 100,
          width:80,
          child: ListTile(
            title: Image.asset(image_location),
            subtitle: Text(image_caption,),
          ),
        ),
      ),
    );
  }
}