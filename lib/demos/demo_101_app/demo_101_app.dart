import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/demos/demo_101_app/values/colors/demo_101_app.dart';
import 'package:flutter_full_learn/demos/demo_101_app/values/dimens/demo_101_app_paddings.dart';
import 'package:flutter_full_learn/demos/demo_101_app/values/strings/demo_100_app_texts.dart';
import 'package:flutter_full_learn/demos/demo_101_app/widgets/elevated_button_widget.dart';
import 'package:flutter_full_learn/demos/demo_101_app/widgets/headline_text_widget.dart';
import 'package:flutter_full_learn/demos/demo_101_app/widgets/image_widget.dart';
import 'package:flutter_full_learn/demos/demo_101_app/widgets/subtitle_text_widget.dart';
import 'package:flutter_full_learn/demos/demo_101_app/widgets/text_button_widget.dart';

class Demo101App extends StatelessWidget {
  const Demo101App({Key? key}) : super(key: key);

  final double _onboardingImgWidth = 250;
  final double _onboardingImgHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Demo101AppColors.appBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        color: Demo101AppColors.appBackgroundColor,
        padding: Demo101AppPaddings.pagePadding,
        child: Column(
          children: [
            Padding(
              padding: Demo101AppPaddings.imagePadding,
              child: ImageWidget(
                name: Demo101AppTexts.onboardingImgName,
                width: _onboardingImgWidth,
                height: _onboardingImgHeight,
              ),
            ),
            const HeadlineTextWidget(headline: Demo101AppTexts.headline),
            Padding(
              padding: Demo101AppPaddings.subtitlePadding,
              child: SubtitleTextWidget(
                  subtitle: Demo101AppTexts.subtitle,
                  textAlign: TextAlign.center),
            ),
            const Spacer(),
            const ElevatedButtonWidget(
              buttonText: Demo101AppTexts.buttonText,
            ),
            const TextButtonWidget(
              text: Demo101AppTexts.textButtonText,
            )
          ],
        ),
      ),
    );
  }
}
