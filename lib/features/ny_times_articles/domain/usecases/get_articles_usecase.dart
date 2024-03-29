import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/repositories/article_repository.dart';

class GetArticlesUseCase {
  final ArticleRepository articleRepository;
  GetArticlesUseCase(this.articleRepository);

  Future<List<Article>> execute() {
    return articleRepository.getArticles();
  }
}
