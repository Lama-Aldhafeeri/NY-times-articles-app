import 'package:flutter/material.dart';
import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          article.abstract,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(article.section),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  size: 16,
                ),
                Text(article.publishedDate),
              ],
            )
          ],
        )
      ],
    );
  }
}
