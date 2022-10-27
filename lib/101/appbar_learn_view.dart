import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarLearnView extends StatelessWidget {
  const AppbarLearnView({Key? key}) : super(key: key);

  final String _welcomeTitle = 'Merhaba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true, // Default: Android -> false, IOS -> true 
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        leadingWidth: 40,
        // iconTheme: IconThemeData(color: Colors.red),
        // textTheme: , deprecated!
        // toolbarTextStyle: TextStyle(color: Colors.blue),
        automaticallyImplyLeading: false, // Navigation auto back button managing
        //systemOverlayStyle: SystemUiOverlayStyle.light, // Status Bar
        title: Text(_welcomeTitle),
        leading: Icon(Icons.chevron_left),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Center(child: Column(
            children: [
              CircularProgressIndicator(),
              Text('Yükleniyor...')
            ],
          ))
        ],
      ),
      body: Container(),
    );
  }
}
