import 'package:flutter/material.dart';
import '../colors/demo_101_app.dart';
import '../dimens/demo_101_app_paddings.dart';
import '../dimens/demo_101_app_radiuses.dart';
import '../dimens/demo_101_app_sizes.dart';

class Demo101AppTextStyles {
  Demo101AppTextStyles({required this.context});

  final BuildContext context;

  get headlineTextStyle => Theme.of(context).textTheme.headline6?.copyWith(
      color: Demo101AppColors.headlineColor, fontWeight: FontWeight.bold);

  get subtitleTextStyle => Theme.of(context).textTheme.subtitle2?.copyWith(
        color: Demo101AppColors.headlineColor,
      );

  get buttonStyle => ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll<Color>(Demo101AppColors.buttonBgColor),
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
          Demo101AppPaddings.buttonPadding),
      shape: MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: Demo101AppRadiuses.buttonBorderRadius)));

  get buttonTextStyle => Theme.of(context).textTheme.button?.copyWith(
      color: Demo101AppColors.buttonTextColor,
      fontWeight: FontWeight.bold,
      fontSize: Demo101AppSizes.buttonTextSize,
      letterSpacing: 1,
      wordSpacing: 2);

  get textButtonTextStyle => Theme.of(context).textTheme.button?.copyWith(
        color: Demo101AppColors.buttonBgColor,
        fontWeight: FontWeight.w600,
      );
}