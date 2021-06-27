import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/body.dart';
class ShopPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation:0,
      leading:
      IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black38,), onPressed:() {}),
      actions:<Widget>[
        IconButton(icon: Icon(Icons.search_rounded,color: Colors.black38,), onPressed:() {}),
        IconButton(icon: Icon(Icons.shopping_cart_rounded,color: Colors.black38,), onPressed:() {}),

        SizedBox(width: conDefaultPad/2,) //adding padding to the page

      ],

    );
  }
}