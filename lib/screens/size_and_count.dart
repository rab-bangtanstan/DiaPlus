import 'package:flutter/material.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/constants.dart';

class SizeAndCount extends StatelessWidget {
  const SizeAndCount({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Text("S"),
              //Just some styling for S M L
              Row(
                children: [
                  RichText(
                      text:TextSpan(
                          style:TextStyle(
                              color:Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          children: [
                            TextSpan(
                              text:" S     ",
                            )
                          ]
                      )
                  ),
                  RichText(
                      text:TextSpan(
                          style:TextStyle(
                              color:Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                          children: [
                            TextSpan(
                              text:"M     ",
                            )
                          ]
                      )
                  ),
                  RichText(
                      text:TextSpan(
                          style:TextStyle(
                              color:Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          children: [
                            TextSpan(
                              text:"L",
                            )
                          ]
                      )
                  ),
                  //Text(" S        "),
                  //Text("M        "),
                  //Text("L"),
                ],
              ),


              Row(
                children: <Widget>[
                  SizeOption(color:product.color,isSelected:1),
                  SizeOption(color:product.color),
                  SizeOption(color:product.color),
                ],
              )
              //Sizes options for the product and send the desired color
            ],
          ),
        ),
        RichText(   //optional expanded if needed
            text:TextSpan(
                style:TextStyle(
                    color:Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize:18
                ),
                children: [
                  TextSpan(
                    text:"Count\n ",
                  ),
                  TextSpan(text:"${product.cnt} strips",
                      style: Theme.of(context).textTheme.headline6.copyWith(color:Colors.black87))
                ]

            )
        )
      ],
    );
  }
}
class SizeOption extends StatelessWidget {
  final Color color;
  final int isSelected;
  const SizeOption({
    Key key, this.color, this.isSelected=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top:conDefaultPad/4,
            right:conDefaultPad/2
        ),
        padding: EdgeInsets.all(2.5),
        //child:Text("  S"),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:Border.all(
            //color: isSelected ? color:Colors.transparent,
            color:isSelected == 1? color:Colors.transparent,
            //color:color,
            //color:Color(0XFF119EB4),
          ),
        ),
        child:DecoratedBox(
          decoration: BoxDecoration(
            color:color,
            //color:Color(0XFF119EB4),
            shape: BoxShape.circle,
          ),
        )
    );
  }
}

