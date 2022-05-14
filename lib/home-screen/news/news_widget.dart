import 'package:app_news/api-manager.dart';
import 'package:app_news/home-screen/news/news-item.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/sourcesResponse.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});
  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late ScrollController scrollController;
  bool shouldLoadNextPage = false;
  int page = 1;
  List<Article> news = [];
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
          // print('At The Top');
        } else {
          // print('At The Bottom');
          shouldLoadNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldLoadNextPage == true) {
      ApiManager.getNews(sourceId: widget.source.id, page: ++page)
          .then((newsResponse) {
            print(page);
              if(newsResponse != null){
               setState(() {
                 news.addAll(newsResponse.articles!.toList());
                 shouldLoadNextPage=false;
               });
              }

      });
    }
    return FutureBuilder<NewsResponse>(
      builder: (context, snapshot) {
        //  in case has error
         if (snapshot.hasError) {
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
         //in case has data
         else if(snapshot.hasData){
           if(news.isEmpty){
             news=snapshot.data!.articles??[];
           }
           if(snapshot.data!.articles![0].title!=news.elementAt(0).title){
             scrollController.jumpTo(0);
             news=snapshot.data!.articles??[];
           }
           return ListView.builder(
             controller: scrollController,
             itemBuilder: (context, index) {
               return NewsItem(article: news[index]);
             },
             itemCount: news.length,
           );
         }
        //in case loading
        else  {
          return Center(child: CircularProgressIndicator());
        }
      },
      future: ApiManager.getNews(sourceId: widget.source.id ?? ''),
    );
  }
}
