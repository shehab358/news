import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/shared/api_constans.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsAPIDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceID) async {
    final uri = Uri.http(
      ApiConstans.baseURL,
      ApiConstans.newsEndpoint,
      {
        'apiKey': ApiConstans.apiKey,
        'sources': sourceID,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('Failed to get news');
    }
  }
}
