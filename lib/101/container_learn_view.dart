import 'package:flutter/material.dart';

class ContainerLearnView extends StatelessWidget {
  const ContainerLearnView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        // width: 50,
        // height: 50,
        constraints: const BoxConstraints(
            maxHeight: 150, maxWidth: 150, minHeight: 30, minWidth: 30),
        //color: Colors.blue,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10),
        decoration: ProjectContainerDecorations(), // ProjectUtilys.greenBoxDecoration,
        child: Text('a' * 100),
      ),
    );
  }
}

class ProjectUtilys {
  static BoxDecoration greenBoxDecoration = BoxDecoration(
            // color: Colors.blue,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white12, width: 10),
            gradient: const LinearGradient(colors: [Colors.green, Colors.black], stops: [0.5, 1]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 10, offset: Offset(0.1, 1))
            ]);
}

class ProjectContainerDecorations extends BoxDecoration {
  ProjectContainerDecorations() : super(
    shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white12, width: 10),
            gradient: const LinearGradient(colors: [Colors.green, Colors.black], stops: [0.5, 1]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 10, offset: Offset(0.1, 1))
            ]
  );
}
