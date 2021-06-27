import 'package:flutter/material.dart';

class Activity{
  String title,image;
  Color color;
  int id;
  Activity({
    this.title,
    this.color,
    this.id,
    this.image
  });
}

List<Activity> act_options=[
  Activity(
    id:1,
    title:' Glucose Tracker',
    image:'assets/images/Glucose_level_resize.jpg',
    color:Color(0XFF119EB4),
  ),

  Activity(
    id:2,
    title:'  Supplies',
    image:'assets/images/Strips_needles_resize.jpg',
    color:Color(0XFF119EB4),
  ),

];