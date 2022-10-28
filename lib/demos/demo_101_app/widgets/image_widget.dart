import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.name,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
    );
  }

  String get path => 'assets/png/$name.png';
}