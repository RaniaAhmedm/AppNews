import 'package:app_news/api-manager.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/news-response/news-item.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  Article article;
  NewsWidget( this.article);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<NewsResponse>(
          builder: (context, snapshot) {
            List<Article> articleList = snapshot.data!.articles!;
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
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(
                  urlImage: article.url ?? '',
                  newsSource: article.source?.id ?? '',
                  newsDescription: article.description ?? '',
                  newsTime: article.publishedAt ?? '',
                );
              },
              itemCount: articleList.length,
            );
          },
          future: ApiManager.getNews(article.source?.id ?? ''),
        )
      ],
    );
  }
}
