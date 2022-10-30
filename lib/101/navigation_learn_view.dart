import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/navigation_learn_detail.dart';

class NavigationLearnView extends StatefulWidget {
  const NavigationLearnView({super.key});

  @override
  State<NavigationLearnView> createState() => _NavigationLearnViewState();
}

class _NavigationLearnViewState extends State<NavigationLearnView>
    with NavigatorManager {
  final List<int> _selectedItems = [];

  void _addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? _selectedItems.add(index) : _selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () async {
            final response = await navigateToWidgetFuture<bool>(
                context, NavigationLearnDetail(isOkey: _selectedItems.contains(index),));
            if (response is bool) {
              _addSelected(index, response);
            }
          },
            child: Placeholder(
              color: _selectedItems.contains(index) ? Colors.green : Colors.red,
            ),
          );
        }),
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final response = await navigateToWidgetFuture<bool>(
                context, const NavigationLearnDetail());
            if (response != false) {}
          },
          child: const Icon(Icons.chevron_right_outlined)),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => widget)));
  }

  Future<T?> navigateToWidgetFuture<T>(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .push<T>(MaterialPageRoute(builder: ((context) => widget)));
  }
}
