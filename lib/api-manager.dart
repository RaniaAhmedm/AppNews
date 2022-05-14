import 'dart:convert';

import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/sourcesResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // baseurl constant for server
  static const String baseUrl = 'newsapi.org';
  static Future<SourcesResponse> getSources(
      String sourceId, String searchKeyWord) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      "apiKey": "23a7c3519e4d4d3e98ed7a8d13421883",
      "category": sourceId,
      "q": searchKeyWord
    });
    var response = await http.get(url);
    try {
      //todo:response successful and convert json to data class

      var bodyStringRes = response.body;
      var json = jsonDecode(bodyStringRes);
      var sourceResponse = SourcesResponse.fromJson(json);
      return sourceResponse;
    } catch (e) {
      //todo:in case any error throw exception
      throw (e);
    }
  }

  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyword, sourcekId,int page=1}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      "apiKey": "23a7c3519e4d4d3e98ed7a8d13421883",
      "sources": sourceId,
      "q": searchKeyword,
      "page":"$page"
    });
    var response = await http.get(url);
    try {
      var bodyStringRes = response.body;
      var json = jsonDecode(bodyStringRes);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
