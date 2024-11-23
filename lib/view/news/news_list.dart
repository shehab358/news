import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/view/news/news_item.dart';
import 'package:news/view/widgets/error_indicator.dart';
import 'package:news/view/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList(
    this.sourceID, {
    super.key,
  });

  final String sourceID;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNEws(sourceID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
          ;
        }
      },
    );
  }
}
