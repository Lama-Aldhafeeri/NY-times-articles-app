import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';

abstract class ArticleDataSource {
  Future<List<Article>> getArticles();
}
