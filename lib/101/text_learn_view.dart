import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key});

  final ProjectKeys keys = ProjectKeys();
  final String user = "Ömer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Projem"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${keys.welcomeText} $user ${user.length}',
              style: ProjectStyles.welcomeStyle(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Text(
              '${keys.welcomeText} $user ${user.length}',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: ProjectColors.welcomeColor,
                  decoration: TextDecoration.underline),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle() {
    return const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
        fontFamily: "",
        decoration: TextDecoration.underline,
        color: Colors.blue);
  }
}

class ProjectColors {
  static Color welcomeColor = Colors.blue;
}

class ProjectKeys {
  final String welcomeText = "Merhaba";
}
