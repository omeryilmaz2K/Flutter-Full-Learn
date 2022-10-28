import 'package:flutter/material.dart';

class ListtileLearnView extends StatelessWidget {
const ListtileLearnView({ Key? key }) : super(key: key);

  final String _title = 'List Tile Learn View';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Image.network('https://icons.iconarchive.com/icons/hydrattz/multipurpose-alphabet/256/Letter-F-blue-icon.png'),
              // contentPadding: EdgeInsets.zero,
              title: const Text('My Card'),
              subtitle: const Text('How do you use your card'),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}