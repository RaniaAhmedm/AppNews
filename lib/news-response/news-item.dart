import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  String urlImage;
  String newsTime;
  String newsDescription;
  String newsSource;

  NewsItem(
      {required this.urlImage,
      required this.newsSource,
      required this.newsDescription,
      required this.newsTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.fill,
          ),
          Text(newsSource),
          Text(newsDescription),
          Text(newsTime),
        ],
      ),
    );
  }
}
