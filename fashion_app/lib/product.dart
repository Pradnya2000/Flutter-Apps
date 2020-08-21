
import 'package:fashion_app/pages/product_details.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final String img;
  final String oldPrice;
  final String newPrice;

  Product({this.name, this.img, this.oldPrice, this.newPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
            tag: name,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ProductDetails(proName: name,proImg: img,proOldPrice: oldPrice,proNewPrice: newPrice,);
                  }));
                },
                child: GridTile(
                  child: Image.asset(img),
                  footer: Container(
                    color: Colors.white54,
                    child: ListTile(
                      leading: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        '$newPrice',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '$oldPrice',
                        style: TextStyle(color: Colors.blueGrey[900]),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
