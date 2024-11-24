import 'package:flutter/material.dart';
import 'package:news/news/data/models/source.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSource();
  List<Source> sources = [];
  String? errMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      final response = await dataSource.getSource(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!.cast<Source>();
      } else {
        errMessage = 'Failed to get sources';
      }
    } catch (e) {
      errMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
