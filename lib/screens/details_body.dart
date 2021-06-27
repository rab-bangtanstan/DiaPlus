import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/product_title_image.dart';
import 'package:travel_app/screens/size_and_count.dart';
import 'package:travel_app/screens/Description.dart';
import 'package:travel_app/screens/cart_count.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //gives total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height:size.height,
            child:Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:size.height * 0.3),  // puts a white box upt0 70% from the bottom
                  padding: EdgeInsets.only(
                      top:size.height * 0.12,
                      left:conDefaultPad,
                      right: conDefaultPad,),

                  //height:500,

                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  //details below the image and price
                  child: Column(
                    children: <Widget>[
                      SizeAndCount(product: product), //widget extracted and is in size_and_count.dart file
                      Description(product: product), //widget extracted and is in Description.dart file
                      CartLikeButton(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: conDefaultPad),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin:EdgeInsets.only(right:conDefaultPad),
                              height: 50,
                                width: 58,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(18),
                                border: Border.all(color:product.color),
                              ),
                              //child: Icon(Icons.add_shopping_cart_rounded,color: product.color,),

                              child:IconButton(
                                icon:Icon(Icons.add_shopping_cart_rounded,color: product.color,),
                                onPressed: (){},)
                            ),

                            Expanded(
                              child: SizedBox(
                                height: 50,
                              child: FlatButton(
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                                ),
                                color: product.color,
                                  onPressed:(){},
                                  child: Text(
                                      "Buy Now",
                                       style: TextStyle(
                                         fontSize: 17,
                                         fontWeight: FontWeight.bold,
                                         color:Colors.white
                                       ),)),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),


                ),

                ProductTitleImage(product: product) //extracted and in product_title_image.dart

              ],
            )
          )
        ],
      ),
    );
  }
}

class CartLikeButton extends StatelessWidget {
  const CartLikeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCount(),
        Container(
          padding: EdgeInsets.all(8),
          height:38,width: 38,
          decoration: BoxDecoration(
            color: Color(0XFFFF6464),
            shape:BoxShape.circle,
          ),
          child:Icon(Icons.thumb_up,color: Colors.white,)
        )
      ],
    );
  }
}

//for counter and buy now components:
