import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '101/color_learn_view.dart';
import '101/textfield_learn_view.dart';
import 'demos/demo_colorful_app/demo_colorful_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Temadan okuma
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder()
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          errorColor: ColorItems.red,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.red),
            toolbarTextStyle: TextStyle(color: Colors.blue),
            systemOverlayStyle: SystemUiOverlayStyle.light, // Status Bar
          )),
      home: const DemoColorfulApp(),
    );
  }
}
