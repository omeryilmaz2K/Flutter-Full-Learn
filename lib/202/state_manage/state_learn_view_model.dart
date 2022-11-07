import 'package:flutter/cupertino.dart';
import 'package:flutter_full_learn/202/state_manage/state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpaque = true;

  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpaque = !isOpaque;
    });
  }
}