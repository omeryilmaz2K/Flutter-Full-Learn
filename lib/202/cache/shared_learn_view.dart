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
    _onChangeValue(sharedManager.getString(SharedKeys.title) ?? '');
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
          actions: [_loading()],
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _fabRemove(),
            _fabSave(),
          ],
        ));
  }

  FloatingActionButton _fabSave() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await sharedManager.saveString(SharedKeys.title, _currentValue);
        changeLoading();
      },
      child: const Icon(Icons.save_as_outlined),
    );
  }

  FloatingActionButton _fabRemove() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await sharedManager.remove(SharedKeys.title);
        changeLoading();
      },
      child: const Icon(Icons.delete_outline),
    );
  }

  Center _loading() {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : const SizedBox.shrink(),
    );
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
