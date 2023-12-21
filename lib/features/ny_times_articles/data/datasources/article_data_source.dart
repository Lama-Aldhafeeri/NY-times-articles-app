import 'package:tree_assignment/features/ny_times_articles/domain/entities/article.dart';

abstract class ArticleDataSource {
  Future<List<Article>> getArticles();
}
