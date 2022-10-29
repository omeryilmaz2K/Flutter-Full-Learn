import 'package:flutter/material.dart';

class StatefulLifecycleLearnView extends StatefulWidget {
  const StatefulLifecycleLearnView({super.key, required this.value});
  final String value;

  @override
  State<StatefulLifecycleLearnView> createState() =>
      _StatefulLifecycleLearnViewState();
}

class _StatefulLifecycleLearnViewState
    extends State<StatefulLifecycleLearnView> {
  String _value = '';
  bool _isEven = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = widget.value;
    _isEven = _value.length.isEven;
    _computeValue();
    print('a');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('b');
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycleLearnView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
      _isEven = _value.length.isEven;
      _computeValue();
      print('c');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('d');
  }

  void _computeValue() {
    _isEven ? _value += ' Çift' : _value += ' Tek';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEven ? 'Çift' : 'Tek'),
      ),
      body: Row(
        children: [
          _isEven
              ? ElevatedButton(onPressed: () {}, child: Text(_value))
              : TextButton(onPressed: () {}, child: Text(_value))
        ],
      ),
    );
  }
}
