import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constans.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sources_response/sources_response.dart';

class ApiService {
  static Future<SourcesResponse> getSource(String categoryId) async {
    final uri = Uri.http(
      ApiConstans.baseURL,
      ApiConstans.sourcesEndpoint,
      {
        'apiKey': ApiConstans.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNEws(String sourceID) async {
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
