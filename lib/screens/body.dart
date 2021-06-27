import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/categories.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/screens/details.dart';
import 'package:travel_app/screens/item_card.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: conDefaultPad),
          child: Text("Supplies",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold,color:conTextColor)),
        ),
        Categories(), // calling categories.dart for four categories
        
        Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 10.0, 1.0, 1.0),
              //padding around the items
              // padding:const EdgeInsets.symmetric(horizontal: conDefaultPad),
              child: GridView.builder( // wrapped with padding
                //itemCount: products.length,
                itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75, // to avoid the overflow pixels
                crossAxisSpacing: conDefaultPad,
                mainAxisSpacing: conDefaultPad,
              ),

              //Navigation from Supplies page ... connected with item_card.dart

              itemBuilder: (context,index) =>
                  ItemCard(product: products[index],
                    press: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                              product: products[index],
                            )
                        )
                    ),


                  ),
              ),
            ),
        ),
           // displays items continuously one by one

        //ItemCard() // new widget
      ],
    );
  }
}

