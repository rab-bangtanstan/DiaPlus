import 'package:flutter/material.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/constants.dart';

class ProductTitleImage extends StatelessWidget {
  const ProductTitleImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding( // extracted widget here
      padding: const EdgeInsets.symmetric(horizontal: conDefaultPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Insulin Strips",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline4.
            copyWith(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: conDefaultPad/4,),
          Row(
            children:<Widget> [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(text: "\$${product.price}",
                    style: Theme.of(context).textTheme.headline4.
                    copyWith(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
              ),
              SizedBox(width: conDefaultPad,),
              Expanded(child: Image.asset(
                product.image,
                //  fit:BoxFit.fitWidth,
              ),)
            ],
          )
        ],
      ),
    );
  }
}
