import 'package:fashion_app/product.dart';
import 'package:fashion_app/productlist.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String proName;
  final String proImg;
  final String proOldPrice;
  final String proNewPrice;
  ProductDetails(
      {this.proName, this.proImg, this.proOldPrice, this.proNewPrice});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Store'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: GridTile(
              child: Container(
                child: Center(child: Image.asset(widget.proImg)),
                color: Colors.white,
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    widget.proName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        widget.proOldPrice + ' Rs',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                        child: Text(
                          widget.proNewPrice + ' Rs',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(child: getButton('size')),
              Expanded(child: getButton('Color')),
              Expanded(child: getButton('Qty')),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Buy Now'),
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {}),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
            child: Text('Product Details',style: TextStyle(fontSize: 16,),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
          ),
          getRow('Product Name', 'xyz'),
          getRow('Product Brand', 'X-Brand'),
          getRow('Product Condition', 'new'),
           Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
            child: Text('Similar Products',style: TextStyle(fontSize: 16,),),
          ),
          ProductList(),
        ],
      ),
    );
  }

  Widget getButton(String name) {
    return MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(name),
              );
            });
      },
      color: Colors.white,
      textColor: Colors.grey,
      child: Row(
        children: <Widget>[
          Expanded(child: Text(name)),
          Expanded(child: Icon(Icons.arrow_drop_down)),
        ],
      ),
    );
  }

  Widget getRow(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width:4),
          Text(description),
        ],
      ),
    );
  }
}
