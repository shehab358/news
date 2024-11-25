import 'package:flutter/material.dart';
import 'package:news/news/data/models/source.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/repositories/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository repository;
  SourcesViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }
  List<Source> sources = [];
  String? errMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      sources = (await repository.getSource(categoryId)).cast<Source>();
    } catch (e) {
      errMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
