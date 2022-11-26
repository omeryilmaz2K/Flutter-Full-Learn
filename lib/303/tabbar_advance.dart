import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/feed_view.dart';
import 'package:flutter_full_learn/demos/demo_101_app/demo_101_app.dart';
import 'package:flutter_full_learn/demos/demo_listview_app/demo_listview_app.dart';

class TabbarAdvance extends StatefulWidget {
  const TabbarAdvance({Key? key}) : super(key: key);

  @override
  State<TabbarAdvance> createState() => _TabbarAdvanceState();
}

class _TabbarAdvanceState extends State<TabbarAdvance>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMargin = 5;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _TabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _TabViews.values.length,
      child: Scaffold(
        extendBody: true,
        body: _TabBarView(tabController: _tabController),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchMargin,
          // shape: const CircularNotchedRectangle(),
          child: _BottomTabBar(tabController: _tabController),
        ),
      ),
    );
  }

  void _fab() {
    _tabController.animateTo(_TabViews.home.index);
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          Demo101App(),
          DemoListviewApp(),
          FeedView(),
        ]);
  }
}

class _BottomTabBar extends StatelessWidget {
  const _BottomTabBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: (int index) {},
        // unselectedLabelColor: Colors.white,
        // labelColor: Colors.cyanAccent,
        // isScrollable: true,
        controller: _tabController,
        tabs: _TabViews.values
            .map((e) => Tab(
                  text: e.name.toUpperCase(),
                ))
            .toList());
  }
}

enum _TabViews { home, profile, favorites }
