import 'package:flutter/material.dart';

class ImageEnumLearnView extends StatelessWidget {
  const ImageEnumLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Image.asset(ImagePaths.img_apple_on_books.path()),
              ImagePaths.img_apple_on_books.toWidget(100),
            ],
          )
        ],
      ),
    );
  }
}

enum ImagePaths { img_apple_on_books }

extension ImagePathExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget([double height = 24]) {
    return Image.asset(path(), height: height,);
  }
}
