import 'package:flutter/material.dart';
part 'part_appbar.dart';

class PartLearnView extends StatefulWidget {
  const PartLearnView({Key? key}) : super(key: key);

  @override
  State<PartLearnView> createState() => _PartLearnViewState();
}

class _PartLearnViewState extends State<PartLearnView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartAppBar(),
    );
  }
}
