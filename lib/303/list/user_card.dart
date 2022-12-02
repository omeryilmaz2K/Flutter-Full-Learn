import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';

class UserCard extends StatelessWidget {
const UserCard({ Key? key, required this.model }) : super(key: key);

  final User model;

  @override
  Widget build(BuildContext context){
    return Text(
      model.name
    );
  }
}