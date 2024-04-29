import 'package:flutter/material.dart';
import 'package:gamification/app/constants.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final Widget errorChild;

  const NetworkImageWidget(
      {Key? key,
      required this.url,
      required this.height,
      required this.width,
      required this.errorChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      Constants.baseUrl + url,
      fit: BoxFit.fill,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => errorChild,
    );
  }
}
