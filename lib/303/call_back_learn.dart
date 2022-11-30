import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/resource_context.dart';
import 'package:flutter_full_learn/303/widgets/answer_button.dart';
import 'package:flutter_full_learn/303/widgets/call_back_dropdown.dart';
import 'package:flutter_full_learn/303/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
      ),
      body: Column(
        children: [
          CallBackDropdown(
            onUserSelected: (CallBackUser user) {
              print(user.name);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              return number % 2 == 0;
            },
          ),
          LoadingButton(title: 'Save', onPressed: () async {
            await Future.delayed(const Duration(seconds: 3));
          },)
        ],
      ),
    );
  }
}

class CallBackUser {
  const CallBackUser(this.id, this.name);

  final int id;
  final String name;

  // TODO: Remove it before release
  static List<CallBackUser> dummyUsers() {
    return [
      const CallBackUser(0, 'Ömer'),
      const CallBackUser(1, 'Mustafa'),
      const CallBackUser(2, 'Vedat')
    ];
  }
}
