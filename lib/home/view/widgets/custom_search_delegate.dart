import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: Theme.of(context).appBarTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        fillColor: AppTheme.white,
        filled: true,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel(),
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errMessage != null) {
            return ErrorIndicator(viewModel.errMessage!);
          } else {
            return ListView.builder(
              itemCount: viewModel.newsList.length,
              itemBuilder: (context, index) => NewsItem(
                viewModel.newsList[index],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel(),
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errMessage != null) {
            return ErrorIndicator(viewModel.errMessage!);
          } else {
            return ListView.builder(
              itemCount: viewModel.newsList.length,
              itemBuilder: (context, index) => NewsItem(
                viewModel.newsList[index],
              ),
            );
          }
        },
      ),
    );
  }
}
