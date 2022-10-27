import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
const ColorLearnView({ Key? key }) : super(key: key);

  final String _title = "Color Learn View";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: Column(
        children: [
          Container(color: ColorItems().cornflowerBlue, child: Text('data')),
          Container(color: Theme.of(context).errorColor, child: Text('data')),
          Container(child: Text('data', style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).errorColor,))),
        ],
      ),
    );
  }
}

class ColorItems {
  final Color cornflowerBlue= Color(0xFF619EED);
  final Color green = Color.fromARGB(100, 0, 255, 0);
  final Color blue = Color.fromRGBO(0, 0, 255, 1);
  static const Color red = Colors.red;
}