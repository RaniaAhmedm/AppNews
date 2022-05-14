import 'package:flutter/material.dart';

class Category {
  String id;
  String image;
  String title;
  Color bgColor;
  Category(
      {required this.id,
      required this.image,
      required this.title,
      required this.bgColor});
  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          image: 'assets/images/sports.png',
          title: 'Sports',
          bgColor: Color.fromRGBO(201, 28, 34, 1.0)),
      Category(
          id: 'general',
          image: 'assets/images/science.png',
          title: 'General',
          bgColor: Color.fromRGBO(0, 62, 144, 1.0)),
      Category(
          id: 'health',
          image: 'assets/images/health.png',
          title: 'Health',
          bgColor: Color.fromRGBO(237, 30, 121, 1.0)),
      Category(
          id: 'business',
          image: 'assets/images/bussines.png',
          title: 'Business',
          bgColor: Color.fromRGBO(207, 126, 72, 1.0)),
      Category(
          id: 'entertainment',
          image: 'assets/images/environment.png',
          title: 'Environment',
          bgColor: Color.fromRGBO(0, 62, 144, 1.0)),
      Category(
          id: 'science',
          image: 'assets/images/science.png',
          title: 'Science',
          bgColor: Color.fromRGBO(242, 211, 82, 1.0)),
      Category(
          id: 'technology',
          image: 'assets/images/bussines.png',
          title: 'Technology',
          bgColor: Color.fromRGBO(207, 126, 72, 1.0)),

    ];
  }
}
