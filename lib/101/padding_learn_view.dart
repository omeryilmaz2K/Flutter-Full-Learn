import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
const PaddingLearnView({ Key? key }) : super(key: key);

  final String _title = "Padding Learn View";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: Padding(
        padding: const EdgeInsets.all(ProjectPaddings.pagePadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: ProjectPaddings.containerVerticalPadding),
              child: Container(color: Colors.white, height: 100,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: ProjectPaddings.containerRightOnlyPadding),
              child: Container(color: Colors.white, height: 100,),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPaddings {
  static const double containerVerticalPadding = 10;
  static const double pagePadding = 20;
  static const double containerRightOnlyPadding = 10;
}