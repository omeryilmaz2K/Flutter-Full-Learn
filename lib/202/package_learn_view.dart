import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_mixin.dart';
import 'package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  final Uri _url = Uri.parse('https://pub.dev/packages/flutter_spinkit');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoadingBar(
        size: 100,
        color: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        launchURL(_url);
      }),
    );
  }
  
  @override
  void name(params) {
    // TODO: implement name
  }
}
