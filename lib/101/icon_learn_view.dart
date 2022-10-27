import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);

  final String _title = "Icon Learn View";
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(children: [
        Icon(
          Icons.account_balance_outlined,
          color: iconColors.iconColor,
          size: IconSizes().iconSmall,
        ), // Outlined best practice
        Icon(
          Icons.account_balance_outlined,
          color: iconColors.mandy,
          size: IconSizes().iconSmall,
        ),
        Icon(
          Icons.account_balance_outlined,
          color: Theme.of(context).backgroundColor,
          size: IconSizes().iconSmall,
        ),
        Icon(
          Icons.account_balance_outlined,
          color: Theme.of(context).errorColor,
          size: IconSizes().iconSmall,
        ),
      ]),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
}

class IconColors {
  final Color iconColor = Colors.red;
  final Color mandy = Color(0xFFED6170);
}
