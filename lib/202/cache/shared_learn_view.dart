import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({Key? key}) : super(key: key);

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStateful<SharedLearnView> {
  @override
  void initState() {
    super.initState();
    sharedManager = SharedManager();
    init();
  }

  Future<void> init() async {
    changeLoading();
    await sharedManager.init();
    changeLoading();
    getDefaultValue();
  }

  void getDefaultValue() {
    _onChangeValue(sharedManager.get(SharedKeys.title) ?? '');
  }

  String _currentValue = '';
  late final SharedManager sharedManager;

  void _onChangeValue(String value) {
    setState(() {
      _currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_currentValue),
          actions: [
            Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink(),
            )
          ],
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () async {
                changeLoading();
                await sharedManager.remove(SharedKeys.title);
                changeLoading();
              },
              child: const Icon(Icons.delete_outline),
            ),
            FloatingActionButton(
              onPressed: () async {
                changeLoading();
                await sharedManager.save(SharedKeys.title, _currentValue);
                changeLoading();
              },
              child: const Icon(Icons.save_as_outlined),
            ),
          ],
        ));
  }
}

abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
