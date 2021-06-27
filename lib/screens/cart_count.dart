import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';


class CartCount extends StatefulWidget {
  @override
  _CartCountState createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  int itemCount=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget> [
        buildCartButton(
            icon:Icons.remove,
            press:(){
              setState(() {
                if(itemCount>1)
                  itemCount--;  //decrements the value of count only if no.of.items is 1 or more
              });
            }
        ) ,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: conDefaultPad/2),
          child: Text(
            itemCount.toString().padLeft(2,"0"),
            //"01",
            style:Theme.of(context).textTheme.headline6,
          ),
        ),

        buildCartButton(
            icon:Icons.add,
            press:(){
              setState(() {
                itemCount++;   //increments the count of add icon is pressed
              });
            }
        )

        //for cart items counter
      ],
    );
  }

  SizedBox buildCartButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: press,
        //onPressed: (){},
        child:Icon(icon),
        //child: Icon(Icons.remove),
      ),
    );
  }
}







