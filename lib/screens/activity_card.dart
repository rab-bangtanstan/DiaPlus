import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/models/Activities.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final Function press;

  const ActivityCard({
    Key key,
    this.activity,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap:press,  // connected with body.dart (takes to next page when an item card is clicked)

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(           // Box color decoration for product image
            padding: EdgeInsets.all(conDefaultPad),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color:activity.color,
              borderRadius: BorderRadius.circular(16),
            ),

            child: Image.asset(activity.image), // displaying the product image
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: conDefaultPad/4),
            child: Text(                                   // Display product name
              activity.title,
              style: TextStyle(color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 16),
                textAlign:TextAlign.center

            ),


          ),
          //Text("\$${product.price}",style: TextStyle(fontWeight: FontWeight.bold),) // displays  product price


        ],
      ),
    );
    //return Container();
  }
}
