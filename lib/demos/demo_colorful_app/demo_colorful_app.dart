import 'package:flutter/material.dart';

class DemoColorfulApp extends StatefulWidget {
  const DemoColorfulApp({super.key, this.initalColor});
  final Color? initalColor;

  @override
  State<DemoColorfulApp> createState() => _DemoColorfulAppState();
}

enum _BackgroundColors { blue, green, red }

class _DemoColorfulAppState extends State<DemoColorfulApp> {
  Color? _backgroundColor;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backgroundColor = widget.initalColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant DemoColorfulApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.initalColor != _backgroundColor && widget.initalColor != null) {
      _changeBacgroundColor(widget.initalColor!);
    }
  }

  final boxDecoration = const BoxDecoration(
      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]);

  void _changeBacgroundColor(Color color) {
    _backgroundColor = color;
    setState(() {});
  }

  void _changeCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => _changeBacgroundColor(Colors.transparent) , icon: const Icon(Icons.clear))],
      ),
      body: Container(
        color: _backgroundColor,
      ),
      bottomNavigationBar: Container(
        decoration: boxDecoration,
        child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: _changeBackground,
            items: const [
              BottomNavigationBarItem(
                  icon: _NavBarItemIcon(
                    color: Colors.blue,
                  ),
                  label: 'Blue'),
              BottomNavigationBarItem(
                  icon: _NavBarItemIcon(
                    color: Colors.green,
                  ),
                  label: 'Green'),
              BottomNavigationBarItem(
                  icon: _NavBarItemIcon(
                    color: Colors.red,
                  ),
                  label: 'Red'),
            ]),
      ),
    );
  }

  void _changeBackground(int value) {
    _changeCurrentIndex(value);
    if (value == _BackgroundColors.blue.index) {
      _changeBacgroundColor(Colors.blue);
    } else if (value == _BackgroundColors.green.index) {
      _changeBacgroundColor(Colors.green);
    } else if (value == _BackgroundColors.red.index) {
      _changeBacgroundColor(Colors.red);
    }
  }
}

class _NavBarItemIcon extends StatelessWidget {
  const _NavBarItemIcon({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        color: color,
        width: 10,
        height: 10,
      ),
    );
  }
}
