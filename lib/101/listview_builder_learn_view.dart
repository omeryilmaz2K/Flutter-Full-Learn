import 'package:flutter/material.dart';

class ListviewBuilderLearnView extends StatefulWidget {
  const ListviewBuilderLearnView({ Key? key }) : super(key: key);

  @override
  State<ListviewBuilderLearnView> createState() => _ListviewBuilderLearnViewState();
}

class _ListviewBuilderLearnViewState extends State<ListviewBuilderLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 100,
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemBuilder: (context, index) {
        return Column(
          children: [
            const Placeholder(),
            Text('$index')
          ],
        );
      }),
    );
  }
}