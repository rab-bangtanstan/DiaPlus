import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/models/Product.dart';

class ItemCard extends StatelessWidget {   // To Display the items (with all details)
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

//product has list of all products and details ...access it with '.' operation

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap:press,  // connected with body.dart (takes to next page when an item card is clicked)

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(           // Box color decoration for product image
            padding: EdgeInsets.all(conDefaultPad),
            height: 166,
            width: 150,
            decoration: BoxDecoration(
              color:product.color,
              borderRadius: BorderRadius.circular(16),
            ),

            child: Image.asset(product.image), // displaying the product image
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: conDefaultPad/6),
            child: Text(                                   // Display product name
              product.title,
              style: TextStyle(color: conTextLightColor),),
          ),
          Text("\$${product.price}",style: TextStyle(fontWeight: FontWeight.bold),) // displays  product price


        ],
      ),
    );
  }
}
