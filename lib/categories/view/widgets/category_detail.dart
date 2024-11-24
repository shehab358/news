import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/view/widgets/sources.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail(this.categoryId, {super.key});

  final String categoryId;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errMessage != null) {
            return ErrorIndicator(viewModel.errMessage);
          } else {
            return SourcesTabs(viewModel.sources.cast<Source>());
          }
        },
      ),
    );
  }
}
