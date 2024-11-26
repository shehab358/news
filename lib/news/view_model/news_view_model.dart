import 'package:flutter/material.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository repository;
  NewsViewModel() {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }

  List<Article> newsList = [];

  bool isLoading = false;
  String? errMessage;
  Future<void> getNews(String sourceID) async {
    isLoading = true;
    notifyListeners();
    try {
      newsList = await repository.getNews(sourceID);
    } on Exception catch (e) {
      errMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    isLoading = true;
    notifyListeners();
    try {
      newsList = await repository.searchNews(query);
    } on Exception catch (e) {
      errMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
