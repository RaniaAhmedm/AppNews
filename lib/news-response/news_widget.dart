import 'package:app_news/api-manager.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/news-response/news-item.dart';
import 'package:flutter/material.dart';
import '../model/sourcesResponse.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget( {required this.source});
  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        builder: (context, snapshot) {
          //in case loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //  in case has error
          else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text('Something went Wrong'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Try Again'),
                  )
                ],
              ),
            );
          }
          //in case status != 'ok'
          else if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                )
              ],
            );
          }
          //in case has data
            List<Article> articlesList=snapshot.data?.articles??[];
            return Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                return NewsItem(article: articlesList[index]);
              },
          itemCount: articlesList.length,
          ),
            );


        },
        future: ApiManager.getNews(widget.source.id ?? ''),
      ),
    );
  }
}
