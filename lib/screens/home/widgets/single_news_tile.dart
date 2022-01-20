import 'package:flutter/material.dart';
import 'package:flutter_api_test/core/routes/route_constants.dart';
import 'package:flutter_api_test/models/models.dart';
import 'package:flutter_api_test/screens/widgets/custom_fade_in_image.dart';

class SingleNewsTileWidget extends StatelessWidget {
  const SingleNewsTileWidget({Key? key, required this.newsModel}) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: newsModel.title.replaceAll('', ''),
        child: CustomFadeInImage(imageUrl: newsModel.urlToImage),
      ),
      title: Text(newsModel.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Text(newsModel.description, maxLines: 2, overflow: TextOverflow.ellipsis),
      onTap: () {
        Navigator.pushNamed(context, RouteConstants.routeNewsDetail, arguments: newsModel);
      },
    );
  }
}
