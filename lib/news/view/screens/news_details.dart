import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String route = 'NewsDetails';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    final args = ModalRoute.of(context)!.settings.arguments as NewsDetailsArg;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.source ?? " "),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl:
                      args.urlToImage ?? 'https://via.placeholder.com/150',
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  args.source ?? '',
                  style: titleSmall!.copyWith(color: AppTheme.navy),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                args.title ?? '',
                style: titleLarge!.copyWith(
                  color: AppTheme.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  timeago.format(
                    DateTime.parse(args.publishedAt!),
                  ),
                  style: titleSmall.copyWith(color: AppTheme.navy),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  args.content ?? '',
                  style: titleSmall.copyWith(
                    color: AppTheme.navy,
                    fontSize: 18,
                  ),
                  maxLines: 9,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                onPressed: () {
                  _launchURL(args.url ?? 'www.google.com');
                  print('Attempting to launch URL: ${args.url}');
                },
                child: const Text(
                  'View Full Article',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Can't Launch";
    }
  }
}
