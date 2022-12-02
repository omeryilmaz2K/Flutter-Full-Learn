import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/resource_context.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => ResourceContext(),),
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier(),)
  ],
  builder: (context, child) => const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeNotifier>().currentTheme,
      // Temadan okuma
      // theme: ThemeData.dark().copyWith(
      //   bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      //   tabBarTheme: const TabBarTheme(
      //     labelColor: Colors.cyanAccent,
      //     unselectedLabelColor: Colors.white
      //   ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     border: OutlineInputBorder()
      //   ),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      //   listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //     cardTheme: CardTheme(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20))),
      //     errorColor: ColorItems.red,
      //     appBarTheme: const AppBarTheme(
      //       backgroundColor: Colors.transparent,
      //       centerTitle: true,
      //       elevation: 0,
      //       iconTheme: IconThemeData(color: Colors.red),
      //       toolbarTextStyle: TextStyle(color: Colors.blue),
      //       systemOverlayStyle: SystemUiOverlayStyle.light, // Status Bar
      //     )),
      home: const LottieLearn(),
    );
  }
}