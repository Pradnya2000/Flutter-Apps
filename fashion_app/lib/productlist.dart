
import 'package:fashion_app/pages/product_details.dart';
import 'package:fashion_app/product.dart';
import 'package:flutter/material.dart';


class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Blazer2",
      "picture": "images/products/blazer2.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Dress2",
      "picture": "images/products/dress2.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": "200",
      "new_price": "150"
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Hills2",
      "picture": "images/products/hills2.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Pants1",
      "picture": "images/products/pants1.jpg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Pants2",
      "picture": "images/products/pants2.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Skt",
      "picture": "images/products/skt1.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
    {
      "name": "Skt2",
      "picture": "images/products/skt2.jpeg",
      "old_price": "2000",
      "new_price": "1500"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position) {
          return Product(
            name: productList[position]['name'],
            img: productList[position]['picture'],
            oldPrice: productList[position]['old_price'],
            newPrice: productList[position]['new_price'],
          );
        },
        //itemCount: productList.length,
      ),
    );
  }
}
