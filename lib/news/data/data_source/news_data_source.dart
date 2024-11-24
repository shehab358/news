import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constans.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getNEws(String sourceID) async {
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
    return NewsResponse.fromJson(json);
  }
}
