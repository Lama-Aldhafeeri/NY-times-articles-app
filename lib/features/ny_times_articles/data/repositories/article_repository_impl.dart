import 'package:tree_assignment/features/ny_times_articles/data/datasources/remote_article_data_source.dart';
import 'package:tree_assignment/features/ny_times_articles/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  getArticles() {
    return RemoteArticleDataSource().getArticles();
  }
}
