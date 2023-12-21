import 'package:flutter/material.dart';
import 'package:tree_assignment/features/ny_times_articles/domain/entities/article.dart';
import 'package:tree_assignment/features/ny_times_articles/presentation/screens/dsetail.dart';
import 'package:tree_assignment/features/ny_times_articles/presentation/widgets/image.dart';
import 'package:tree_assignment/features/ny_times_articles/presentation/widgets/subtitle.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(article: article))),
        leading: ImageWidget(article: article),
        trailing: const Icon(Icons.arrow_forward_ios),
        title: Text(article.title),
        subtitle: SubtitleWidget(article: article),
      ),
    );
  }
}
