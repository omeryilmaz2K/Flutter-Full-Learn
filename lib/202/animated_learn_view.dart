import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: AppDurations.duration_low));
  }

  bool _isVisible = false;
  bool _isOpaque = true;
  late AnimationController controller;

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpaque = !_isOpaque;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _AnimatedPlaceHolder(),
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpaque ? 1 : 0,
              duration: Duration(seconds: AppDurations.duration_low),
              child: const Text('data'),
            ),
            trailing: IconButton(
                onPressed: _changeOpacity,
                icon: const Icon(Icons.change_circle_outlined)),
          ),
          AnimatedDefaultTextStyle(
              style: _isVisible
                  ? context.textTheme().subtitle1 ?? const TextStyle()
                  : context.textTheme().headline1 ?? const TextStyle(),
              duration: Duration(seconds: AppDurations.duration_low),
              child: const Text('TEXT')),
          AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: controller),
          AnimatedContainer(
            duration: Duration(seconds: AppDurations.duration_low),
            color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.5,
            height: _isVisible ? 0 : MediaQuery.of(context).size.height * 0.2,
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(duration: Duration(seconds: AppDurations.duration_low), top: 50, child: const Text('data'),)
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(itemBuilder: (context, index, animation) {
              return const Text('data');
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisibility();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
    );
  }

  AnimatedCrossFade _AnimatedPlaceHolder() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: AppDurations.duration_low));
  }
}

class AppDurations {
  static int duration_low = 1;
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
