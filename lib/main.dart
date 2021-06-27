import 'package:flutter/material.dart';
import 'package:travel_app/screens/glucose_tracker.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/shopping_page.dart';
import 'package:travel_app/screens/glucose_tracker.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diabetic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       //home:GlucoseTracker(),
       home:HomePage(),   //home_screen.dart
      //home:ShopPage(), //shopping_page.dart
    );
  }
}


