import 'package:flutter/material.dart';

class RowColumnLearnView extends StatelessWidget {
  const RowColumnLearnView({Key? key}) : super(key: key);

  final String _title = 'Row Layout Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max, // default max
        children: const [
          // Expanded(flex: 4, child: Container(color: Colors.red)),
          // const Spacer(
          //   flex: 2,
          // ),
          // Expanded(flex: 2, child: Container(color: Colors.blue)),
          // Expanded(flex: 2, child: Container(color: Colors.yellow)),

          Text('a1'),
          Text('a2'),
          Text('a3'),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // default max
      children: const [
        // Expanded(child: FlutterLogo()),
        // Expanded(child: FlutterLogo()),
        // Expanded(child: FlutterLogo()),
        // Expanded(child: FlutterLogo()),

        /// Expanded, flex, Spacer

        // Expanded(flex: 4, child: Container(color: Colors.red)),
        // const Spacer(flex: 2,),
        // Expanded(flex: 2, child: Container(color: Colors.blue)),
        // Expanded(flex: 2, child: Container(color: Colors.yellow)),

        Text('a1'),
        Text('a2'),
        Text('a3'),
      ],
    );
  }
}
