import 'package:flutter/material.dart';

class StatelessLearnView extends StatelessWidget {
  const StatelessLearnView({Key? key}) : super(key: key);

  final String _title = 'StatelessWidget Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          TextWidget(
            text: "sadd",
          ),
          sizedBox(),
          TextWidget(
            text: "sadd",
          ),
          sizedBox(),
          TextWidget(
            text: "sadd",
          ),
          sizedBox(),
          TextWidget(
            text: "sadd",
          ),
          CustomContainer(),
          sizedBox(),
        ],
      ),
    );
  }

  SizedBox sizedBox() => SizedBox(height: 20,);
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).backgroundColor),
      height: 200,
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
