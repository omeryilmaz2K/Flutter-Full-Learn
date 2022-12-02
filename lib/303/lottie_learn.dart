import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn/constant/duration_constants.dart';
import 'package:flutter_full_learn/303/lottie_learn/constant/lottie_items.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationConstans.durationNormal());
  }

  late final AnimationController controller;
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              controller.animateTo(isLight ? 1 : 0.5);
              isLight = !isLight;
              Future.microtask(() {
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false,
          controller: controller))
        ],
      ),
      body: const _LoadingLottie(),
    );
  }
}

class _LoadingLottie extends StatelessWidget {
  const _LoadingLottie({
    Key? key,
  }) : super(key: key);

  final String _lottieUrl =
      'https://assets3.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_lottieUrl));
  }
}
