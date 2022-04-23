import 'package:app_news/api-manager.dart';
import 'package:app_news/model/sourcesResponse.dart';
import 'package:app_news/sources-response/tap-container.dart';
import 'package:flutter/material.dart';
class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Home Screen';
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}
class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Column(
          children: [
            FutureBuilder<SourcesResponse>(
                future: ApiManager.getSources(),
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
