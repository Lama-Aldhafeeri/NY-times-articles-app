import 'package:ny_times_articles/.keys.dart';
import 'package:ny_times_articles/features/ny_times_articles/data/datasources/article_data_source.dart';
import 'package:ny_times_articles/features/ny_times_articles/data/models/article_model.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';
import 'package:dio/dio.dart';

class RemoteArticleDataSource extends ArticleDataSource {
  @override
  Future<List<Article>> getArticles() {
    return getArticlesFromUrl(
        'http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=$myKey');
  }

  Future<List<Article>> getArticlesFromUrl(String url) async {
    final dio = Dio();
    final response = await dio.get(url);
    final List<Article> listOfArticles = [];
    for (var article in response.data['results']) {
      listOfArticles.add(ArticleModel.fromJson(article));
    }
    return listOfArticles;
  }
}
