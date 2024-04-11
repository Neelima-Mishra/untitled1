import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImageAsset extends StatelessWidget {
  final double height, width;
  final String image;
  final BoxFit? fit;
  final Color? color;

  const CommonImageAsset({
    Key? key,
    required this.image,
    this.fit,
    required this.height,
    required this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  image.contains('http')?Image.network(
      image,
      fit: fit,
      height: height,
      width: width,
      color: color,
    ):
    image.split('.').last == 'png'
        ? Image.asset(
            image,
            fit: fit,
            height: height,
            width: width,
            color: color,
          )
        : SvgPicture.asset(
            image,
            height: height,
            width: width,
          );
  }
}
