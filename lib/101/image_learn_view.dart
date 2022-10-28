import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({Key? key}) : super(key: key);

  final String _title = "Image Learn View";
  final String _imgPath = 'https://cdn3.iconfinder.com/data/icons/workspace-stationery/4/books-512.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                ImageItems().books,
                fit: BoxFit.cover,
              )),
          SizedBox(height: 300, width: 300, child: PngImage(path: ImageItems().path,)),
          Image.network(_imgPath, errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),)
        ],
      ),
    );
  }
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.path,}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) => Image.asset(pathString, fit: BoxFit.cover,);

  String get pathString => 'assets/png/$path.png';
}

class ImageItems {
  final String appleOnBooks = "assets/apple-books-vector.png";
  final String books = "assets/png/books.png";
  final String path = "books";
}
