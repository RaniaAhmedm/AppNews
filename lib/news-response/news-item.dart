import 'package:app_news/model/NewsResponse.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  Article article;

  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          article.url ?? '',
          fit: BoxFit.fill,
        ),
        Text(article.source?.name ?? ''),
        Text(article.description ?? ''),
        Text(article.publishedAt ?? ''),
      ],
    );
  }
}
