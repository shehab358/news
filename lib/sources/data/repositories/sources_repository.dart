import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;
  SourcesRepository(this.dataSource);

  Future<List<Source>> getSource(String categoryId) async {
    return dataSource.getSource(categoryId);
  }
}
