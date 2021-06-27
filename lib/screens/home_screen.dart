import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/screens/categories.dart';
import 'package:travel_app/models/Product.dart';
import 'package:travel_app/screens/details.dart';
import 'package:travel_app/screens/glucose_tracker.dart';
import 'package:travel_app/screens/item_card.dart';
import 'package:travel_app/screens/activity_card.dart';
import 'package:travel_app/models/Activities.dart';
import 'package:travel_app/screens/shopping_page.dart';

// class HomeScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Container();
//   }
// }

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:30.0), // for space at left and right side of column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //left alignment
              children:[

                SizedBox(height:50), //Sized box 1

                Row(
                  mainAxisAlignment: MainAxisAlignment.end, //right aligned
                  children:[
                    IconButton(icon: Icon(Icons.settings), onPressed:() {}),
                    IconButton(icon: Icon(Icons.menu_rounded), onPressed:() {}),

                  ],
                ),

                SizedBox(height:35), //Sized box 2
                Text.rich(
                  TextSpan(
                      text:'Welcome,',
                      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 50),
                      children: [
                        TextSpan(
                          
                          style:TextStyle(fontWeight: FontWeight.normal,fontSize: 45),
                        ),
                      ]
                  ),
                ),
                SizedBox(height:30), //sized box 3
                TextField(decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,size:18),//Icon inside the search bar
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText:'Search', // default text inside search box
                ),
                ),


                SizedBox(height:40), //Sized Box 4
                Text(
                  'Activities',
                  style:TextStyle(fontWeight:FontWeight.w600,fontSize: 20),

                ),
                SizedBox(height:10), //Sized Box 5

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 15.0, 1.0, 1.0),
                    //padding around the items
                    //padding:const EdgeInsets.symmetric(horizontal: conDefaultPad),
                    child: GridView.builder( // wrapped with padding
                      //itemCount: products.length,
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75, // to avoid the overflow pixels
                        crossAxisSpacing: conDefaultPad,
                        mainAxisSpacing: conDefaultPad,
                      ),

                      //Navigation from Supplies page ... connected with item_card.dart

                      itemBuilder: (context,index) =>
                          ActivityCard(activity:act_options[index],
                            press: ()=> Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:(context) => ShopPage(
                                  ),
                                  // builder:(context) => GlucoseTracker(
                                  // ),
                                    // builder: (context) => Details(
                                    //   product: products[index],
                                    // )
                                )
                            ),



                          ),

                    ),

                  ),
                ),

                // SizedBox(
                //     height: 300,
                //     child:GridView.count(
                //       crossAxisCount: 2,
                //       children:[
                //         for (var act in activities)
                //           Image.asset('assets/images/$act.jpg')
                //       ],
                //
                //     )
                // )

              ],
            )

        )

    );
  }
}
//final activities = ['Diet_resize','Glucose_level_resize','Strips_needles_resize','Water_intake_resize'];
final activities = ['Glucose_level_resize','Strips_needles_resize'];


