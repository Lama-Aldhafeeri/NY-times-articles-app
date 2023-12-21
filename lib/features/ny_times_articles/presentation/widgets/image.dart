import 'package:flutter/material.dart';
import 'package:tree_assignment/features/ny_times_articles/domain/entities/article.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.article,
    this.height,
    this.width,
    this.radius,
  });

  final Article article;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 25.0),
      child: Image.network(
        article.imageUrl,
        width: width ?? 50,
        height: height ?? 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const SizedBox(
          child: Icon(
            Icons.error,
            size: 36,
          ),
        ),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress?.expectedTotalBytes == null) {
            return child;
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
