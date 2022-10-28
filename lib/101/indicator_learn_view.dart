import 'package:flutter/material.dart';

class IndicatorLearnView extends StatelessWidget {
const IndicatorLearnView({ Key? key }) : super(key: key);

  final String _title = 'Indicator Learn View';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(_title), actions: const [
        Center(child: CustomCircularIndicator())
      ],),
      body: Column(
        children: const [
          Center(child: CustomCircularIndicator()),
          SizedBox(height: 100,),
          LinearProgressIndicator()
        ],
      ),
    );
  }
}

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(/* color: Colors.white */);
  }
}