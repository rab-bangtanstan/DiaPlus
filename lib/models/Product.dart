import 'package:flutter/material.dart';

class Product {
    String image,title,desc;
    int price,cnt,id;
    Color color;
    Product({
      this.image,
      this.title,
      this.desc,
      this.price,
      this.cnt,
      this.id,
      this.color,
});
}

List<Product> products=[
  Product(
    id:1,
    title:'Accu Check',
    price:123,
    cnt:50,
    desc:'Accu-Chek Active strip is a hassle-free easy to use the product. Not require any kind of manual coding. Determination of glucose in fresh capillary blood by reflectance photometry technology.',
    image:'assets/images/accu_chek_bg.png',
    color:Color(0XFF119EB4),
  ),

  Product(
    id:2,
    title:'One Touch Verio',
    price:123,
    cnt:50,
    desc:'Uses OneTouch Verio test strips — 9 years of proven accuracy at very low and very high blood glucose levels.ColorSure technology instantly shows when your blood sugar numbers are in or out of range.',
    image:'assets/images/onetouch_bg.png',
    color:Color(0XFFEDC143),
  ),

  Product(
    id:3,
    title:'Contour TS',
    price:123,
    cnt:50,
    desc:'Contour TS Blood Glucose Test Strip has solid test strip design that provides a good grip for easy handling. It enables the user to measure blood glucose concentration. It can be used at home and by professionals.  ',
    image:'assets/images/contour_bg.png',
    color:Color(0XFFFF8821),
  ),
  Product(
    id:4,
    title:'Gluco Spot',
    price:123,
    cnt:50,
    desc:'The Gluco SPOT Strips are to be used with Gluco SPOT blood glucose monitor for accurate results.The strip require 5 seconds of analysis time to measure the sugar level.The shelf life of the strip is 24 months from the date of manufacturing',
    image:'assets/images/gluco_spot_bg.png',
    color:Color(0XFFE23655),
  ),
  Product(
    id:5,
    title:'One Touch Select',
    price:123,
    cnt:50,
    desc:'Blood glucose test strips are the key component of blood glucose testing. These small disposable strips of plastic are used along with blood glucose meter to measure the level of glucose in the blood.',
    image:'assets/images/onetouch_select_bg.png',
    color:Color(0XFF6CC742),
  ),
  Product(
    id:6,
    title:'Gluco Check',
    price:123,
    cnt:50,
    desc:'GlucoChek is ideal for checking self Blood Glucose level. Gives result in 9 seconds.It is the most adequate and accurate device for self monitoring your blood glucose  level. It requires very tiny sample of blood and user friendly medical device.',
    image:'assets/images/gluco_chek_bg.png',
    color:Color(0XFFAD6FA1),
  ),
];