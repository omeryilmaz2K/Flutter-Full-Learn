import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/call_back_learn.dart';

class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({Key? key, required this.onUserSelected}) : super(key: key);

  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDropdown> createState() => _CallBackDropdownState();
}

class _CallBackDropdownState extends State<CallBackDropdown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? callBackUser) {
    setState(() {
      _user = callBackUser;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _user,
      items: CallBackUser.dummyUsers().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.name),
        );
      }).toList(),
      onChanged: _updateUser,
    );
  }
}
