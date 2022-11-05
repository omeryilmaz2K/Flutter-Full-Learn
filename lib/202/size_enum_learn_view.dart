import 'package:flutter/material.dart';

class SizeEnumLearnView extends StatefulWidget {
  const SizeEnumLearnView({ Key? key }) : super(key: key);

  @override
  State<SizeEnumLearnView> createState() => _SizeEnumLearnViewState();
}

class _SizeEnumLearnViewState extends State<SizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          color: Colors.red,
          height: CardSizes.normalCardHeight.value(),
        ),
      ),
    );
  }
}

enum CardSizes {
  normalCardHeight,
  largeCardHeight
}

extension CardSizesExtension on CardSizes {
  double value() {
    switch (this) {
      case CardSizes.normalCardHeight:
        return 20;
      case CardSizes.largeCardHeight:
        return 30;
    }
  }
}