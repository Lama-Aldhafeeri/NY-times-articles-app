import 'package:get_it/get_it.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/repositories/article_repository.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/usecases/get_articles_usecase.dart';
import 'package:test/test.dart';

class FakeArticleRepository implements ArticleRepository {
  @override
  Future<List<Article>> getArticles() async {
    // Return predefined data for testing
    return [
      Article(
        title: 'Fake Article 1',
        abstract: 'Description of Fake Article 1.',
        section: 'Test Section',
        imageUrl: 'https://example.com/fake-article-1.jpg',
        publishedDate: '2023-01-01',
      ),
      Article(
        title: 'Fake Article 2',
        abstract: 'Description of Fake Article 2.',
        section: 'Test Section',
        imageUrl: 'https://example.com/fake-article-2.jpg',
        publishedDate: '2023-01-02',
      ),
    ];
  }
}

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.registerLazySingleton<ArticleRepository>(
        () => FakeArticleRepository());
    getIt.registerLazySingleton<GetArticlesUseCase>(
        () => GetArticlesUseCase(getIt<ArticleRepository>()));
  });

  tearDown(() {
    getIt.reset();
  });

  group('GetarticleUseCase', () {
    late GetArticlesUseCase getArticleUseCase;

    setUp(() {
      getArticleUseCase = getIt<GetArticlesUseCase>();
    });

    test('should get a list of articles from the repository', () async {
      // Act
      final result = await getArticleUseCase.execute();

      // Assert
      expect(
          result.length, equals(2)); // Assuming two fake articles are returned
    });
  });
}
