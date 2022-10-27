import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/appbar_learn_view.dart';
import 'package:flutter_full_learn/101/button_learn_view.dart';
import 'package:flutter_full_learn/101/container_learn_view.dart';
import 'package:flutter_full_learn/101/icon_learn_view.dart';
import 'package:flutter_full_learn/101/scaffold_learn_view.dart';
import 'package:flutter_full_learn/101/sizedbox_learn_view.dart';
import 'package:flutter_full_learn/101/text_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Temadan okuma -> App Bar
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red),
        toolbarTextStyle: TextStyle(color: Colors.blue),
        systemOverlayStyle: SystemUiOverlayStyle.light, // Status Bar
      )),
      home: IconLearnView(),
    );
  }
}
