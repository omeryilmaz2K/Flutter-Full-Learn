import 'package:flutter/material.dart';

import '../values/styles/demo_101_app_text_styles.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key, required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: Demo101AppTextStyles(context: context).textButtonTextStyle,
        ));
  }
}