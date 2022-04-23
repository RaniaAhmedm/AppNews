import 'dart:convert';

import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/sourcesResponse.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  // baseurl constant for server
  static const String baseUrl='newsapi.org';
  static Future<SourcesResponse> getSources()async{
    var url=Uri.https(baseUrl,'/v2/top-headlines/sources',{
      "apiKey":"d20b941e0b8d4d2aaf06b7ee130632a6"
    });
    var response= await http.get(url);
    try{
      //todo:response successful and convert json to data class

      var bodyStringRes=response.body;
      var json=jsonDecode(bodyStringRes);
      var sourceResponse=SourcesResponse.fromJson(json);
        return sourceResponse;
    }catch(e){
      //todo:in case any error throw exception
      throw (e);
    }
  }
  //GET https://newsapi.org/v2/everything?
  // q=apple&from=2022-04-22&to=2022-04-22&sortBy=popularity&
  // apiKey=d20b941e0b8d4d2aaf06b7ee130632a6
 static Future<NewsResponse> getNews(String sourceId)async{
    var url=Uri.https(baseUrl, '/v2/everything',{
      "apiKey":"d20b941e0b8d4d2aaf06b7ee130632a6",
      "sources":sourceId

    });
    var response= await http.get(url);
    try{
      var bodyStringRes=response.body;
      var json=jsonDecode(bodyStringRes);
      var newsResponse=NewsResponse.fromJson(json);
      return newsResponse;
    }catch(e){
      throw e;
    }
  }
}