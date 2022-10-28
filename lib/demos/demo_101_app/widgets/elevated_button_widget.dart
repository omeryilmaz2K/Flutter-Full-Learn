import 'package:flutter/material.dart';

import '../values/styles/demo_101_app_text_styles.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: Demo101AppTextStyles(context: context).buttonStyle,
      child: Center(
        child: Text(
          buttonText,
          style: Demo101AppTextStyles(context: context).buttonTextStyle,
        ),
      ),
    );
  }
}