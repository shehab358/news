import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {

  
  const NewsList(
    this.sourceID, {
    super.key,
  });

  final String sourceID;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel(
    
  );
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceID);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errMessage != null) {
            return ErrorIndicator(viewModel.errMessage);
          } else {
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(viewModel.newsList[index]),
              itemCount: viewModel.newsList.length,
            );
          }
        },
      ),
    );
  }
}
