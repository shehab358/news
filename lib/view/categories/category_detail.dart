import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/view/categories/tabs/sources.dart';
import 'package:news/view/widgets/error_indicator.dart';
import 'package:news/view/widgets/loading_indicator.dart';

class CategoryDetail extends StatelessWidget {
  CategoryDetail(this.categoryId, {super.key});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSource(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(source: sources);
        }
      },
    );
  }
}
