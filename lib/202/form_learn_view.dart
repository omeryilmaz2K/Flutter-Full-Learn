import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({ Key? key }) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print('object');
        },
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(items: const [
              DropdownMenuItem(value: 'a',child: Text('data'),),
              DropdownMenuItem(value: 'b',child: Text('data2'),),
              DropdownMenuItem(value: 'c',child: Text('data3'),),
            ], onChanged: (value) {
              
            },),
            ElevatedButton(onPressed: () {
              if (_key.currentState?.validate() ?? false) {
                print('object');
              }
            }, child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'Boş geçilemez!';
  }
}