import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/oop_learn.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({ Key? key }) : super(key: key);

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  @override
  void initState() {
    super.initState();
    fileDownload = FileDownload();
  }

  FileDownload? fileDownload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fileDownload?.downloadItem(null);
      }),
    );
  }
}