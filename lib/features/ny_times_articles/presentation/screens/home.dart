import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_articles/features/ny_times_articles/data/repositories/article_repository_impl.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/usecases/get_articles_usecase.dart';
import 'package:ny_times_articles/features/ny_times_articles/presentation/ui_logic/riverpod.dart';
import 'package:ny_times_articles/features/ny_times_articles/presentation/widgets/article_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final GetArticlesUseCase getArticlesUseCase =
      GetArticlesUseCase(ArticleRepositoryImpl());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 78, 223, 208),
          title: const Center(child: Text('NY Times Most Popular Articles')),
        ),
        body: FutureBuilder(
          future: ref.read(articlesPlaceProvider.notifier).getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Article> article = snapshot.data as List<Article>;
              return ListView.builder(
                itemCount: article.length,
                itemBuilder: (context, index) {
                  return ArticleCard(article: article[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
