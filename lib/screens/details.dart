import 'package:flutter/material.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/details_body.dart';

//add to cart wala page

class Details extends StatelessWidget {
  final Product product;

  const Details({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color, // displays product's color as the background color
      appBar: buildAppBar(context),
      body: DetailsBody(product: product),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color, //appbar also becomes product's color
      elevation: 0, // no separation be appbar and main screen

      //leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black38,), onPressed:() {}),

      actions: <Widget>[
        IconButton(icon: Icon(Icons.search_rounded,color: Colors.white,), onPressed:() {}),
        IconButton(icon: Icon(Icons.shopping_cart_rounded,color: Colors.white,), onPressed:() {}),

        SizedBox(width:conDefaultPad/2)

      ],
    );
  }
}
