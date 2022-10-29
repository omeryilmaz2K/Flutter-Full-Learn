import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/card_learn_view.dart';
import 'package:flutter_full_learn/101/customwidget_learn_view.dart';
import 'package:flutter_full_learn/101/stack_learn_view.dart';

class PageViewUtility {
  static const double viewportFraction = 1;
  static const Duration nextDuration = Duration(seconds: 1);
  static const Duration previousDuration = Duration(seconds: 1);
  static const nextCurve = Curves.bounceInOut;
  static const previousCurve = Curves.bounceIn;
}

class PageviewLearnView extends StatefulWidget {
  const PageviewLearnView({Key? key}) : super(key: key);

  @override
  State<PageviewLearnView> createState() => _PageviewLearnViewState();
}

class _PageviewLearnViewState extends State<PageviewLearnView> {
  final _pageController =
      PageController(viewportFraction: PageViewUtility.viewportFraction);
  int _currentPageIndex = 0;

  void _nextPage() {
    _pageController.nextPage(
        duration: PageViewUtility.nextDuration,
        curve: PageViewUtility.nextCurve);
  }

  void _previousPage() {
    _pageController.previousPage(
        duration: PageViewUtility.previousDuration,
        curve: PageViewUtility.previousCurve);
  }

  void _callPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        onPageChanged: _callPageIndex,
        controller: _pageController,
        children: const [
          CustomwidgetLearnView(),
          StackLearnView(),
          CardLearnView()
        ],
      ),
      floatingActionButton: Row(
        children: [
           Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          _backButton(),
          _nextButton(),
        ],
      ),
    );
  }

  FloatingActionButton _backButton() {
    return FloatingActionButton(
        onPressed: _previousPage,
        child: const Icon(Icons.chevron_left_outlined));
  }

  Padding _nextButton() {
    return Padding(
      padding: UtilityPaddings.nextButtonPadding,
      child: FloatingActionButton(
          onPressed: _nextPage,
          child: const Icon(Icons.chevron_right_outlined)),
    );
  }
}

class UtilityPaddings {
  static const nextButtonPadding = EdgeInsets.only(left: 10);
}
