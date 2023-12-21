import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_articles/features/ny_times_articles/data/repositories/article_repository_impl.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/usecases/get_articles_usecase.dart';

class ArticlesNotifier extends StateNotifier<List<Article>> {
  ArticlesNotifier() : super(const []);

  final GetArticlesUseCase getArticlesUseCase =
      GetArticlesUseCase(ArticleRepositoryImpl());

  getArticles() => getArticlesUseCase.execute();
}

final articlesPlaceProvider =
    StateNotifierProvider<ArticlesNotifier, List<Article>>(
        (ref) => ArticlesNotifier());
