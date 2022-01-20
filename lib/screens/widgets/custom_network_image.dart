import 'package:flutter/material.dart';
import 'package:flutter_api_test/screens/widgets/loading_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.deviceHeight, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      height: deviceHeight * 0.3,
      width: double.infinity,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return SizedBox(
          height: deviceHeight * 0.3,
          child: const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        );
      },
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          height: deviceHeight * 0.3,
          child: const CustomLoadingWidget(),
        );
      },
    );
  }
}
