import 'package:app_news/api-manager.dart';
import 'package:app_news/model/category.dart';
import 'package:app_news/model/sourcesResponse.dart';
import 'package:app_news/home-screen/category-details/tap-container.dart';
import 'package:flutter/material.dart';
class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Home Screen';
  Category category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}
class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          children: [
            FutureBuilder<SourcesResponse>(
                future: ApiManager.getSources(widget.category.id,"LivePool"),
                builder: (context, snapshot) {
                  //in case loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  //  in case has error
                  else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something went Wrong'),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Try Again'),
                        )
                      ],
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
                  // in case has data
                  List<Source> sourcesList = snapshot.data?.sources ?? [];
                  return TapContainer(
                    sources: sourcesList,
                  );
                }),
          ],
        )
    );
  }
}
