import 'package:ny_times_articles/features/ny_times_articles/domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {required title,
      required abstract,
      required section,
      required imageUrl,
      required publishedDate})
      : super(
            title: title,
            abstract: abstract,
            section: section,
            imageUrl: imageUrl,
            publishedDate: publishedDate);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';
    if (json['media'] != null) {
      if (List.from(json['media']).isNotEmpty &&
          List.from(json['media'][0]['media-metadata']).isNotEmpty) {
        imageUrl = json['media'][0]['media-metadata'][0]['url'];
      }
    }
    return ArticleModel(
        title: json['title'],
        abstract: json['abstract'],
        section: json['section'],
        imageUrl: imageUrl,
        publishedDate: json['published_date']);
  }
}
