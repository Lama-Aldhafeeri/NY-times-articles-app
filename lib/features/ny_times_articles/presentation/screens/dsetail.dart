import 'package:flutter/material.dart';
import 'package:tree_assignment/features/ny_times_articles/domain/entities/article.dart';
import 'package:tree_assignment/features/ny_times_articles/presentation/widgets/back_icon.dart';
import 'package:tree_assignment/features/ny_times_articles/presentation/widgets/image.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                ImageWidget(
                  article: article,
                  radius: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Container(
                  padding: const EdgeInsets.all(35),
                  child: Column(children: [
                    Text(
                      article.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      article.abstract,
                      maxLines: 500,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned(
              left: 25,
              top: 25,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const BackIcon(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
