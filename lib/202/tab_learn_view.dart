import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/navigation_learn_view.dart';
import 'package:flutter_full_learn/demos/demo_101_app/demo_101_app.dart';
import 'package:flutter_full_learn/demos/demo_colorful_app/demo_colorful_app.dart';
import 'package:flutter_full_learn/demos/demo_listview_app/demo_listview_app.dart';

class TabLearnView extends StatefulWidget {
  const TabLearnView({Key? key}) : super(key: key);

  @override
  State<TabLearnView> createState() => _TabLearnViewState();
}

class _TabLearnViewState extends State<TabLearnView>
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
        // appBar: AppBar(
        //     // bottom: const TabBar(tabs: [
        //     //   Tab(
        //     //     text: 'Page 1',
        //     //   ),
        //     //   Tab(
        //     //     text: 'Page 2',
        //     //   )
        //     // ]),
        //     ),
        body: _TabBarView(tabController: _tabController),
        floatingActionButton: FloatingActionButton(
          onPressed: _fab,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            notchMargin: _notchMargin,
            // shape: const CircularNotchedRectangle(),
            child: _BottomTabBar(tabController: _tabController)),
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
          DemoColorfulApp(),
          NavigationLearnView()
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

enum _TabViews { home, profile, favorites, settings }
