import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories=["Glucometer","Strips","Needles","Swabs"]; // category list
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: conDefaultPad), // padding after 'Supplies' text
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index)=>buildCategory(index)
        ),
      ),
    );
  }

  Widget  buildCategory(int index)
  {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index; //navigates through categories tab (through single tap)
        });
      },
      // Glucometer, Strips, needles, Swabs


      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: conDefaultPad ),//custom constant padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: selectedIndex==index? conTextColor:conTextLightColor), //custom constant color
            ),//If category is selected then the text is color black or light color

            Container(
              margin: EdgeInsets.only(top:conDefaultPad/4), //padding for the top part
              height: 2.3,
              width: 30,
              color:selectedIndex == index ? Colors.black:Colors.transparent,
              // If category is selected then the tab is color black or light color
            )
          ],
        ),

      ),
    );
  }
}

