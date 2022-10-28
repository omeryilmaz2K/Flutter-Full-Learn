import 'package:flutter/material.dart';

import '../values/styles/demo_101_app_text_styles.dart';

class HeadlineTextWidget extends StatelessWidget {
  const HeadlineTextWidget({
    Key? key,
    required this.headline,
  }) : super(key: key);

  final String headline;

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: Demo101AppTextStyles(context: context).headlineTextStyle,
    );
  }
}