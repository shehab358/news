import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/shared/api_constans.dart';
import 'package:news/sources/data/models/sources_response.dart';

class SourcesDataSource {
    Future<SourcesResponse> getSource(String categoryId) async {
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
}