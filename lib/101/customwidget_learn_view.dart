import 'package:flutter/material.dart';

class CustomwidgetLearnView extends StatelessWidget {
  const CustomwidgetLearnView({Key? key}) : super(key: key);

  final String _title = 'Custom Widget Learn';
  final String _buttonText = 'Food';
  final String _buttonText2 = 'Add to cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomElevatedButton(
              onPressed: () {},
              title: _buttonText,
            ),
          )),
          const SizedBox(height: 100),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:
                  CustomElevatedButton(title: _buttonText2, onPressed: () {})),
        ],
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget
    with _UtilityColors, _UtilityPaddings {
  CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: customButtonBgColor, shape: const StadiumBorder()),
      onPressed: onPressed,
      child: Padding(
        padding: customButtonPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _UtilityColors {
  final Color customButtonBgColor = Colors.red;
}

class _UtilityPaddings {
  final EdgeInsets customButtonPadding = const EdgeInsets.all(16);
}
