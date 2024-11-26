import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/article.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                NewsDetails.route,
                arguments: NewsDetailsArg(
                  source: article.source?.name ?? '',
                  author: article.author ?? ' ',
                  title: article.title,
                  description: article.description,
                  url: article.url,
                  urlToImage: article.urlToImage,
                  publishedAt: article.publishedAt,
                  content: article.content,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ?? 'https://via.placeholder.com/150',
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Text(
            article.source?.name ?? '',
            style: titleSmall?.copyWith(fontSize: 10, color: AppTheme.grey),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            article.title ?? ' ',
            style: titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(
                DateTime.parse(article.publishedAt!),
              ),
              style: titleSmall?.copyWith(
                color: AppTheme.grey,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsDetailsArg {
  final String? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const NewsDetailsArg({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}
