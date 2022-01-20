import 'package:flutter/material.dart';

class CustomFadeInImage extends StatelessWidget {
  const CustomFadeInImage({
    Key? key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.placeholderImgPath,
  }) : super(key: key);

  final double? imageWidth;
  final double? imageHeight;
  final String imageUrl;
  final String? placeholderImgPath;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(imageUrl),
      height: imageHeight ?? MediaQuery.of(context).size.height * 0.1,
      width: imageWidth ?? MediaQuery.of(context).size.width * 0.2,
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
      placeholder: AssetImage(placeholderImgPath ?? 'assets/images/loading.gif'),
    );
  }
}
