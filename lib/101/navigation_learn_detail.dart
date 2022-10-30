import 'package:flutter/material.dart';

class NavigationLearnDetail extends StatefulWidget {
  const NavigationLearnDetail({super.key, this.isOkey = false});
  final bool isOkey;
  @override
  State<NavigationLearnDetail> createState() => _NavigationLearnDetailState();
}

class _NavigationLearnDetailState extends State<NavigationLearnDetail> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ModalRoute.of(context).settings.arguments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!widget.isOkey);
            },
            icon: widget.isOkey ? const Icon(Icons.clear) : const Icon(Icons.check),
            label: widget.isOkey ? const Text('İptal Et') : const Text('Onayla')),
      ),
    );
  }
}
