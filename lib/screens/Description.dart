import 'package:flutter/material.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: conDefaultPad),
      child: Text(
          product.desc,
          style:TextStyle(
              height:1.5,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
          ),
          textAlign:TextAlign.justify  //make the content justified
      ),
    );
  }
}