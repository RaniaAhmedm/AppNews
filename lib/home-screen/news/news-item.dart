import 'package:app_news/home-screen/details/screen-details.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  Article article;

  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ScreenDetails.routeName,arguments: article);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: article.urlToImage == null
                  ? Icon(Icons.broken_image)
                  : Image.network(
                      article.urlToImage ?? '',
                      fit: BoxFit.cover,
                      height: 120,
                    ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              article.author ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              article.title ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              article.publishedAt ?? '',
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
