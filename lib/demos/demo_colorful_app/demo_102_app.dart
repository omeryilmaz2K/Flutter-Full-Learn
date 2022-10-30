import 'package:flutter/material.dart';

class Demo102App extends StatefulWidget {
  const Demo102App({Key? key}) : super(key: key);

  @override
  State<Demo102App> createState() => _Demo102AppState();
}

class _Demo102AppState extends State<Demo102App> {
  Color? _bodyBacgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 9, child: Body(backgroundColor: _bodyBacgroundColor)),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _changeBackgroundButton('Mavi', Colors.blue),
                    _changeBackgroundButton('Yeşil', Colors.green),
                    _changeBackgroundButton('Kırmızı', Colors.red)
                  ]))
        ],
      ),
    );
  }

  ElevatedButton _changeBackgroundButton(String buttonText, Color color) =>
      ElevatedButton(
          onPressed: () => _changeBackground(color), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)), child: Text(buttonText),);

  void _changeBackground(Color color) {
    _bodyBacgroundColor = color;
    setState(() {});
  }
}

class Body extends StatefulWidget {
  Body({super.key, this.backgroundColor});
  Color? backgroundColor;

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.backgroundColor;
  }

  @override
  void didUpdateWidget(covariant Body oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.backgroundColor != widget.backgroundColor) {
      _backgroundColor = widget.backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
    );
  }
}
