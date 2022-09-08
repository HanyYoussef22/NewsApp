import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String titel;
  String image;
  Color ColorCode;
  CategoryModel(this.id,this.titel,this.ColorCode,this.image);

 static List<CategoryModel>getCategoryes(){
    return [
      //   general
      CategoryModel('sports', 'Sports', Color(0xffC91C22), 'assets/images/ball.png'),
      CategoryModel('general', 'General', Color(0xff003E90), 'assets/images/Politics.png'),
      CategoryModel('health', 'Health', Color(0xffED1E79), 'assets/images/health.png'),
      CategoryModel('business', 'Business ', Color(0xffCF7E48), 'assets/images/bussines.png'),
      CategoryModel('entertainment', 'Environment', Color(0xff4882CF), 'assets/images/environment.png'),
      CategoryModel('science', 'Science', Color(0xffF2D352), 'assets/images/science.png'),
    ];
  }

}