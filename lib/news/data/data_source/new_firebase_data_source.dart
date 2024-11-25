import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/article.dart';

class NewFirebaseDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceID) {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}
