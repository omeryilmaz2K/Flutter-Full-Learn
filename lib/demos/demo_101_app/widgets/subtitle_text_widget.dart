import 'package:flutter/material.dart';

import '../values/styles/demo_101_app_text_styles.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    Key? key,
    required this.subtitle,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String subtitle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Demo101AppTextStyles(context: context).subtitleTextStyle,
      textAlign: textAlign,
    );
  }
}