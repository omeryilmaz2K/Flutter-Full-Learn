import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLearnView extends StatefulWidget {
  const SecureStorageLearnView({Key? key}) : super(key: key);

  @override
  State<SecureStorageLearnView> createState() => _SecureStorageLearnViewState();
}

enum SecureKeys {
  // ignore: constant_identifier_names
  Text
}

class _SecureStorageLearnViewState extends State<SecureStorageLearnView> {
  String _title = '';
  final TextEditingController _controller = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    getItem();
  }

  void getItem() async {
    _title = await storage.read(key: SecureKeys.Text.name) ?? '';
  }

  void saveItem(String title) {
    setState(() {
      _title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await storage.write(key: SecureKeys.Text.name, value: _title);
        },
        label: const Text('Save'),
      ),
      body: TextField(
        controller: _controller,
        onChanged: saveItem,
      ),
    );
  }
}
