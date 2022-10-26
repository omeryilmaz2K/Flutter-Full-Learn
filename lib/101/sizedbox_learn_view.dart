import 'package:flutter/material.dart';

class SizedboxLearnView extends StatelessWidget {
  const SizedboxLearnView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text("data" * 100),
          ),
          const SizedBox.shrink(),
          SizedBox.square(dimension: 50, child: Text("data" * 50),)
        ],
      ),
    );
  }
}
