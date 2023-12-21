import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/repositories/article_repository.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/usecases/get_articles_usecase.dart';

// Mock class for ArticleRepository
class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  group('GetarticleUseCase', () {
    late GetArticlesUseCase getArticleUseCase;
    late MockArticleRepository mockRepository;

    setUp(() {
      mockRepository = MockArticleRepository();
      getArticleUseCase = GetArticlesUseCase(mockRepository);
    });

    test('should get a list of article from the repository', () async {
      // Arrange
      final mockArticle = [
        Article(
            title:
                'What Worries Me About the Gaza War After My Trip to Arab States',
            abstract:
                'A legitimate Palestinian partner and a commitment to negotiating a two-state solution are key.',
            section: 'Opinion',
            imageUrl:
                'https://static01.nyt.com/images/2023/12/14/multimedia/12friedman-1-mqlv/12friedman-1-mqlv-thumbStandard.jpg',
            publishedDate: '2023-12-12'),
        Article(
            title:
                'What Worries Me About the Gaza War After My Trip to Arab States',
            abstract:
                'A legitimate Palestinian partner and a commitment to negotiating a two-state solution are key.',
            section: 'Opinion',
            imageUrl:
                'https://static01.nyt.com/images/2023/12/14/multimedia/12friedman-1-mqlv/12friedman-1-mqlv-thumbStandard.jpg',
            publishedDate: '2023-12-12'),
      ];

      // Stub the repository's getArticle method
      when(mockRepository.getArticles()).thenAnswer((_) async => mockArticle);

      // Act
      final result = await getArticleUseCase.execute();

      // Assert
      expect(result, equals(mockArticle));
      // Verify that the repository's getArticle method was called exactly once
      verify(mockRepository.getArticles()).called(1);
      // Verify that no more interactions with the repository occurred
      verifyNoMoreInteractions(mockRepository);
    });

    test('should throw an exception if the repository fails', () async {
      // Arrange
      // Stub the repository's getArticle method to throw an exception
      when(mockRepository.getArticles()).thenThrow(Exception('Test exception'));

      // Act & Assert
      expect(() => getArticleUseCase.execute(), throwsException);
      // Verify that the repository's getArticle method was called exactly once
      verify(mockRepository.getArticles()).called(1);
      // Verify that no more interactions with the repository occurred
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
