import 'package:flutter/material.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier {
  List<Article> newsList = [];
  final dataSourcse = NewsDataSource();
  bool isLoading = false;
  String? errMessage;
  Future<void> getNews(String sourceID) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSourcse.getNEws(sourceID);
      if (response.status == 'ok' && response.articles != null) {
        newsList = response.articles!;
      } else {
        errMessage = 'Failed to get News';
      }
    } on Exception catch (e) {
      errMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
