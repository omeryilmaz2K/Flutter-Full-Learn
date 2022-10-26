import 'package:flutter/material.dart';

import 'container_learn_view.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text("data")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) => Container(height: 200),);
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(),
      // bottomSheet: ,
      bottomNavigationBar: Container(
        // width: , Expanded
        height: 150,
        decoration: ProjectContainerDecorations(),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: title),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: title)
        ]),
      ),
    );
  }
}
