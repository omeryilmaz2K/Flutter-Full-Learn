import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme:
        const TextTheme(subtitle1: TextStyle(color: Colors.red, fontSize: 20)),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(color: _DarkThemeColor().confetti),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    )
    // bottomAppBarTheme:
    //     const BottomAppBarTheme(shape: CircularNotchedRectangle()),
    // tabBarTheme: const TabBarTheme(
    //     labelColor: Colors.cyanAccent, unselectedLabelColor: Colors.white),
    // inputDecorationTheme:
    //     const InputDecorationTheme(border: OutlineInputBorder()),
    // progressIndicatorTheme:
    //     const ProgressIndicatorThemeData(color: Colors.white),
    // listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
    // cardTheme: CardTheme(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    // errorColor: ColorItems.red,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.transparent,
    //   centerTitle: true,
    //   elevation: 0,
    //   iconTheme: IconThemeData(color: Colors.red),
    //   toolbarTextStyle: TextStyle(color: Colors.blue),
    //   systemOverlayStyle: SystemUiOverlayStyle.light, // Status Bar
    // ),
  );
}

class _DarkThemeColor{
  final Color confetti = const Color(0xFFE2ED61);
}
