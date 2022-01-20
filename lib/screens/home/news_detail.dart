import 'package:flutter/material.dart';
import 'package:flutter_api_test/core/utils/date_utils.dart';
import 'package:flutter_api_test/models/models.dart';
import 'package:flutter_api_test/screens/widgets/custom_network_image.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(newsModel.title)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSection(deviceHeight),
              _buildNewsDetailSection(context, deviceHeight, deviceWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsDetailSection(BuildContext context, double deviceHeight, double deviceWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03, vertical: deviceHeight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(newsModel.title, style: Theme.of(context).textTheme.subtitle1),
          SizedBox(height: deviceHeight * 0.02),
          _buildDateAndSourceRow(),
          SizedBox(height: deviceHeight * 0.01),
          Text(newsModel.content),
          SizedBox(height: deviceHeight * 0.01),
          Text(
            'Author : ${newsModel.author}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildDateAndSourceRow() {
    return Row(
      children: [
        Expanded(
          child: Text(
            getFormattedDate(newsModel.publishedAt),
            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
          ),
        ),
        Text(newsModel.source.name, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
      ],
    );
  }

  Widget _buildImageSection(double deviceHeight) {
    return Hero(
      tag: newsModel.title.replaceAll('', ''),
      child: CustomNetworkImage(deviceHeight: deviceHeight, imageUrl: newsModel.urlToImage),
    );
  }
}
