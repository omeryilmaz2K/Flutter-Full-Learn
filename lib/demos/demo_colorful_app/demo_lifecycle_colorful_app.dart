import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/demo_colorful_app/demo_colorful_app.dart';

class DemoLifecycleColorfulApp extends StatefulWidget {
  const DemoLifecycleColorfulApp({Key? key}) : super(key: key);

  @override
  State<DemoLifecycleColorfulApp> createState() =>
      _DemoLifecycleColorfulAppState();
}

class _DemoLifecycleColorfulAppState extends State<DemoLifecycleColorfulApp> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _backgroundColor = Colors.amber;
                setState(() {});
              },
              icon: const Icon(Icons.change_circle_outlined))
        ],
      ),
      body: Column(
        children:  [
          const Spacer(),
          Expanded(child: DemoColorfulApp(initalColor: _backgroundColor,)),
        ],
      ),
    );
  }
}
