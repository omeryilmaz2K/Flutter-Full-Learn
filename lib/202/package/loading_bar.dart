import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key, this.color, this.size}) : super(key: key);
  final Color? color;
  final double? size;
  final double _defaultSize = 50;

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: color,
      size: size ?? _defaultSize,
      // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
