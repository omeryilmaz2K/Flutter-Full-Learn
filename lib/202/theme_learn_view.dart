import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/password_textfield_view.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({ Key? key }) : super(key: key);

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  final String _title = 'Theme Learn View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: const PasswordTextfieldView(),
    );
  }
}